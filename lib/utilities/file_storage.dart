import 'dart:io';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';

final Key yek = Key.fromUtf8("7a50719b64c5d5706ab1e2ec2585e688");
final IV iv = IV.fromUtf8("c5d08f15b2066df4");
final encrypter = Encrypter(AES(yek));

class RoosterFileStorage {
  final filename;
  late String path;
  RoosterFileStorage(this.filename) {
    _initLocalPath();
  }

  void _initLocalPath() async {
    path = await localPath;
    //rprint("file $path/$filename");
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

  bool afterEncryption() {
    final fileModified = File("$path/$filename").lastModifiedSync();
    return fileModified.isAfter(DateTime.parse("2021-11-20 21:32:27.143"));
  }

  Uint8List readFile() {
    final file = File("$path/$filename");
    return file.readAsBytesSync();
  }
}

Future<bool> beforeCurrentRelease() async {
  var rfs = RoosterFileStorage("user.data");
  //needs to change later
  if (await rfs.fileExist) return !rfs.afterEncryption();
  return false;
}

Future<void> saveUserData(UserData userData) async {
  var rfs = RoosterFileStorage("user.data");
  await rfs.fileExist;
  //encrypt.
  var data = encrypter.encryptBytes(userData.writeToBuffer(), iv: iv);
  rfs.writeFile(data.bytes);
}

Future<UserData> readUserData() async {
  var rfs = RoosterFileStorage("user.data");
  UserData userData = UserData();
  if (await rfs.fileExist) {
    var data = rfs.readFile();
    if (rfs.afterEncryption()) {
      userData =
          UserData.fromBuffer(encrypter.decryptBytes(Encrypted(data), iv: iv));
    } else {
      userData = UserData.fromBuffer(data);
    }
  }
  return userData;
}

void saveTrophy(String trophyDir, TrophyData trophyData) {
  var now = DateTime.now();
  final file = File(
      "$trophyDir/${now.year}-${now.month}-${now.day}_${now.hour}_${now.minute}.trophy");
  file.writeAsBytes(trophyData.writeToBuffer());
}

List<TrophyData> getTrophyData(String trophyDir) {
  List<TrophyData> trophyList = [];
  var dirPath = trophyDir;
  var list = Directory('$dirPath').listSync();
  list.forEach((entity) {
    if (entity is File) {
      var data = entity.readAsBytesSync();
      trophyList.add(TrophyData.fromBuffer(data));
    }
  });
  return trophyList;
}
