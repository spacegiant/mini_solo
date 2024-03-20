import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CampaignStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/sampleCampaign.json');
  }

  Future<Object?> readJSON() async {
    try {
      final file = await _localFile;

      // Read the file
      final jsonData = await file.readAsString();

      return json.decode(jsonData) as Map;
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  Future<File> writeJSON(Map data) async {
    final file = await _localFile;

    // Convert MAP to String
    var jsonData = json.encode(data);

    // Write the file
    return file.writeAsString(jsonData);
  }
}
