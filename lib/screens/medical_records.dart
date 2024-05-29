import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:ur_fine/services/database_services.dart';
import 'package:ur_fine/services/show_snack_bar.dart';
import 'package:ur_fine/services/user_details_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalRecords extends StatelessWidget {
  const MedicalRecords({super.key});

  launchFile(String filePath,String filename) async {
    debugPrint("h"+filePath);
    final islandRef = FirebaseStorage.instance.refFromURL(filePath);

    final appDocDir = await getTemporaryDirectory();
    final path = "${appDocDir.path}/$filename";
    final file = File(path);
    try {
      await islandRef.writeToFile(file);
      await file.create();
      await OpenFile.open(path);
      return true;
    }
    catch(E){
      debugPrint(E.toString());
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDetailsProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () async {
          final result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ["pdf", "doc", "png", "jpeg", "jpg", "dcm"],
            allowMultiple: true,
          );
          if (result != null) {
            List<PlatformFile> l = result.files;
            try {
              ShowSnackBar.showSnackBar(context, "Your files are being uploaded please wait!!!");
              await DatabaseServices().uploadAllFiles(
                  l, userProvider.currentUser!.uid!);
              String  uid = userProvider.currentUser!.uid!;
              userProvider.setUserUsingUid(uid);
            }
            catch(e){
              debugPrint(e.toString());
              ShowSnackBar.showSnackBar(context, "Some error occurred! Please try again",color: Colors.red);
            }
          }
        },
        child: Center(
          child: Icon(
            Icons.upload,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: userProvider.currentUser!.media.isEmpty
            ? Center(
                child: Text(
                  "Upload Your Medical Record",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your Medical Records",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: userProvider.currentUser!.media.length,
                        itemBuilder: (BuildContext context, int index) {
                          final fileDetails = userProvider.currentUser!.media[index];
                          return InkWell(
                            onTap: () {
                                ShowSnackBar.showSnackBar(context, "Opening the file");
                                launchFile(fileDetails.filePath!,fileDetails.name!).then((value){
                                  if(!value){
                                    ShowSnackBar.showSnackBar(context, "Can't open this file",color: Colors.red);
                                  }
                                });

                            },
                            child: ListTile(
                              leading: Icon(fileDetails.name!.endsWith("pdf")
                                  ? Icons.picture_as_pdf
                                  :fileDetails.name!.endsWith("doc")
                                      ? Icons.article
                                      : fileDetails.name!.endsWith("jpg") ||
                                  fileDetails.name!.endsWith("png") ||
                                  fileDetails.name!.endsWith("jpeg")
                                          ? Icons.image
                                          : Icons.description),
                              title: Text(fileDetails.name!),
                              trailing: IconButton(
                                onPressed: (){
                                  DatabaseServices().deleteFileFromFirebase(fileDetails.filePath!);
                                  String uid  = userProvider.currentUser!.uid!;
                                  userProvider.setUserUsingUid(uid);
                                  ShowSnackBar.showSnackBar(context, "File deleted Successfully");
                                  DatabaseServices().deleteMedia(fileDetails.toJson(), userProvider.currentUser!.uid!, index);
                                  
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
