import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class RoosterFileStorage {
  final filename;
  late String path;
  RoosterFileStorage(this.filename) {
    _initLocalPath();
  }

  void _initLocalPath() async {
    path = await _localPath;
    print("file $path/$filename");
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<bool> get fileExist async {
    path = await _localPath;
    if (File("$path/$filename").existsSync()) {
      return true;
    }
    return false;
  }

  void writeFile(var data) {
    final file = File("$path/$filename");
    file.writeAsBytesSync(data);
  }

  Uint8List readFile() {
    final file = File("$path/$filename");
    return file.readAsBytesSync();
  }
}
