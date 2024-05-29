import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ur_fine/services/database_services.dart';
import 'package:ur_fine/services/routes.dart';
import 'package:ur_fine/services/show_snack_bar.dart';
import 'package:ur_fine/services/theme_provider.dart';

import '../services/user_details_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  File? galleryFile;
  final picker = ImagePicker();

   Future<bool> getImage(ImageSource img, String userId,String? previousFile) async {
    final pickedFile =
        await picker.pickImage(source: img, maxWidth: 200, maxHeight: 200);
    XFile? xFilePick = pickedFile;

    if (xFilePick != null) {
      try {
        DatabaseServices().storeImageInFirebaseStorage(
            File(pickedFile!.path), userId, pickedFile.name,previousFile);
        return true;
      }
      catch(e){
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDetailsProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: (userProvider.currentUser?.avatar ==
                                    null ||
                                userProvider.currentUser?.avatar == "")
                            ? const AssetImage("assets/images/profile.png")
                            : NetworkImage(userProvider.currentUser!.avatar!)
                                as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          radius: 15,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext bc) {
                                      return Wrap(
                                        children: <Widget>[
                                          ListTile(
                                              leading: const Icon(Icons.camera),
                                              title: const Text('Camera'),
                                              onTap: () => {
                                                    getImage(
                                                        ImageSource.camera,
                                                        userProvider
                                                            .currentUser!.uid!,userProvider.currentUser!.avatar).then((value){
                                                              if(value){

                                                                ShowSnackBar.showSnackBar(context, "Please wait while the image is being updated!");
                                                              }
                                                              else{
                                                                ShowSnackBar.showSnackBar(context, "Image Upload Failed!",color: Colors.red);
                                                              }
                                                    }),
                                      userProvider.setUserUsingUid(userProvider
                                          .currentUser!.uid!),
                                                Navigator.pop(context),


                                              }),
                                          ListTile(
                                            leading:
                                                const Icon(Icons.photo_library),
                                            title: const Text('Gallery'),
                                            onTap: () => {
                                              getImage(
                                                  ImageSource.gallery,
                                                  userProvider
                                                      .currentUser!.uid!,userProvider.currentUser!.avatar).then((value){
                                                if(value){
                                                  ShowSnackBar.showSnackBar(context, "Please wait while the image is being updated!");
                                                }
                                                else{
                                                  ShowSnackBar.showSnackBar(context, "Image Upload Failed!",color: Colors.red);
                                                }
                                              }),
                                      userProvider.setUserUsingUid(userProvider
                                          .currentUser!.uid!),
                                              Navigator.pop(context)
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(
                                Icons.edit,
                                size: 17,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userProvider.currentUser!.name!,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        userProvider.currentUser!.email!,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Consumer<ThemeProvider>(
                    builder: (BuildContext context, ThemeProvider value,
                        Widget? child) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  value.isDark
                                      ? Icons.dark_mode
                                      : Icons.light_mode,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.fontSize,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  value.isDark ? "Dark Theme" : "Light Theme",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                            Switch(
                                value: value.isDark,
                                onChanged: (a) {
                                  value.setIsDark();
                                })
                          ]);
                    },
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        DatabaseServices().signOutUser();
                        ShowSnackBar.showSnackBar(
                            context, "User signed Out Successfully");
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteGenerator.login, (e) => false);
                      },
                      child: Text(
                        "Sign Out",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
