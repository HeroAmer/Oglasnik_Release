import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
Future<String> upload(fileName, filePath, id) async {
  StorageReference storageRef =
      FirebaseStorage.instance.ref().child('images').child(fileName);
  File compressedFile = await FlutterNativeImage.compressImage(filePath,
      quality: 50, percentage: 50);
  final StorageUploadTask task = storageRef.putFile(
    compressedFile,
  );
  return await (await task.onComplete).ref.getDownloadURL();
}
