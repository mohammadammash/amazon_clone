import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<List<File>> pickImages() async {
  List<File> images = [];

  try {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image, //only approve images
    );

    if (result != null && result.files.isNotEmpty) {
      for (int i = 0; i < result.files.length; i++) {
        images.add(File(result.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return images;
}
