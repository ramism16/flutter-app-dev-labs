import 'dart:io';
import 'package:madlab12/models/RandomNumber.dart';
import 'package:path_provider/path_provider.dart';

class fileController{
  static Future<int> readFromFile() async {
    var directory = await getTemporaryDirectory();
    File file = File(directory.path + "/randomNumbers.txt");

    if (file.existsSync()){ return int.parse(file.readAsStringSync().trim()); }
    else{
      return -1;
    }
  }

  static Future<void> saveToFile(int randomNumber) async {
    var directory = await getTemporaryDirectory();
    File file = File(directory.path + "/randomNumbers.txt");
    file.writeAsStringSync(randomNumber.toString(), flush: true, mode: FileMode.write);
  }

  static Future<void> deleteFileValue() async{
    var directory = await getTemporaryDirectory();
    File file = File(directory.path + "/randomNumbers.txt");
    if (file.existsSync())
      file.deleteSync();
  }
}