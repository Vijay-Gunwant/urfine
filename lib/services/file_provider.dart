import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileProvider extends ChangeNotifier{
  List<PlatformFile> _uploadedFiles = [];

  List<PlatformFile> get selectedFiles => _uploadedFiles;

  void uploadFiles(List<PlatformFile> value) {
    _uploadedFiles = value;
    notifyListeners();
  }

}