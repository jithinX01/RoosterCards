import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';

class RoosterFileStorage {
  final filename;
  late String path;
  RoosterFileStorage(this.filename) {
    _initLocalPath();
  }

  void _initLocalPath() async {
    path = await localPath;
    print("file $path/$filename");
  }

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<bool> get fileExist async {
    path = await localPath;
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

void saveTrophy(String trophyDir, TrophyData trophyData) {
  var now = DateTime.now();
  final file = File(
      "$trophyDir/${now.year}-${now.month}-${now.day}_${now.hour}_${now.minute}.trophy");
  file.writeAsBytes(trophyData.writeToBuffer());
}
