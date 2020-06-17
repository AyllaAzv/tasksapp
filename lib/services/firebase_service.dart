import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class FirebaseService {
  static Future<String> uploadFirebaseStorage(File file) async {
    try {
      print("Upload to Storage $file");
      String fileName = path.basename(file.path);
      final storageRef = FirebaseStorage.instance.ref().child(fileName);

      final StorageTaskSnapshot task =
          await storageRef.putFile(file).onComplete;
      final String urlFoto = await task.ref.getDownloadURL();
      print("Storage > $urlFoto");
      return urlFoto;
    } catch (e) {
      print("Erro > $e");
    }
  }
}
