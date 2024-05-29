import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:path_provider/path_provider.dart';

class CampaignListItem {
  String campaignName;
  String path;

  CampaignListItem(this.campaignName, this.path);
}

class CampaignStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<List<FileSystemEntity>> get getCampaignsList async {
    final directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> campaigns = [];

    await for (FileSystemEntity entity in directory.list(
      recursive: false,
      followLinks: false,
    )) {
      bool isSettingsFile = entity.path.contains('appSettings.json');
      var isJsonFile = entity.path.contains('.json');
      if (!isSettingsFile && isJsonFile) {
        campaigns.add(entity);
      }
    }
    return campaigns;
  }

  Future<CampaignData?> readJSON(String fileName) async {
    try {
      final path = await _localPath;
      File file = File('$path/$fileName');
      print(file);

      // Read the file
      final jsonData = await file.readAsString();

      final data = json.decode(jsonData);

      final dataMap = CampaignData.fromJson(data);

      return dataMap;
    } catch (e) {
      if (kDebugMode) {
        print('readJSON error: $e');
      }
      // If encountering an error, return null
      return null;
    }
  }

  Future<void> deleteCampaign(String fileName) async {
    final path = await _localPath;
    File file = File('$path/$fileName');
    if (kDebugMode) {
      print('Deleted file: $file');
    }

    await file.delete();
  }

  Future<File> writeJSON(CampaignData data, String fileName) async {
    final path = await _localPath;

    File file = File('$path/$fileName');

    if (kDebugMode) {
      print('Write JSON: $file');
    }

    // Convert MAP to String
    String jsonData = jsonEncode(data);

    // Write the file
    return file.writeAsString(jsonData);
  }

  // APP SETTINGS
  Future<String?> readAppSettings(String fileName) async {
    try {
      // final file = await _localFile;
      // print(file);

      final path = await _localPath;
      File file = File('$path/$fileName');

      // Read the file
      final data = await file.readAsString();

      return data;
    } catch (e) {
      if (kDebugMode) {
        print('readJSON error: $e');
      }
      // If encountering an error, return null
      return null;
    }
  }

  // TODO: Rename to not be JSON
  Future<File> writeAppSettingsJSON(String data, String fileName) async {
    final path = await _localPath;

    File file = File('$path/$fileName');

    if (kDebugMode) {
      print('Write App Settings: $file');
    }

    // Convert MAP to String
    // String jsonData = jsonEncode(data);

    // Write the file
    return file.writeAsString(data);
  }
}
