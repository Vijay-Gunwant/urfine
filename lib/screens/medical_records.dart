import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ur_fine/services/show_snack_bar.dart';

class MedicalRecords extends StatelessWidget {
  const MedicalRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Upload Your Medical Record",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: OutlinedButton(
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles();
                      if (result != null) {
                        // final fileBytes = result.files.first.bytes;
                        final fileName = result.files.first.name;
                        // Handle the uploaded file (e.g., save it, upload to a server, etc.)
                        debugPrint('Selected file: $fileName');
                      }
                      ShowSnackBar.showSnackBar(context, "This feature is under development!!!");

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload,
                          color: Theme.of(context).colorScheme.secondary,
                          size: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.fontSize,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Upload File",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
