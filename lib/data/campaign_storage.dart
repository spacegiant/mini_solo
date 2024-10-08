import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:path_provider/path_provider.dart';

import '../utilities/fixAppSettingsData.dart';
import '../utilities/fix_json_data.dart';

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

  Future<CampaignData?> readCampaignDataJSON(String fileName) async {
    try {
      final path = await _localPath;
      File file = File('$path/$fileName');

      // Read the file
      final jsonData = await file.readAsString();

      final data = json.decode(jsonData);

      // TODO: DATA MIGRATION Go thru initData and check loaded data matches, replaces with placeholder where appropriate

      // ITERATE INITIAL CAMPAIGN DATA OBJECT

      final initialDecodedData =
          convertCampaignToJSON(baseCampaignData('test'));

      fixCampaignJSONData(initialDecodedData, data);

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
    File file = File(fileName);
    try {
      await file.delete();
    } catch (e) {
      print(e);
    }
  }

  Future printLocalPath() async {
    final path = await _localPath;
    if (kDebugMode) {
      print('Local path -> $path');
    }
  }

  Future<String> getFilePath(String fileName) async {
    final path = await _localPath;
    return '$_localPath$fileName.json';
  }

  Future<File> writeJSON(CampaignData data, String fileName) async {
    final path = await _localPath;

    File file = File('$path/$fileName');

    // Convert MAP to String
    String jsonData = jsonEncode(data);

    // Write the file
    return file.writeAsString(jsonData);
  }

  Future<AppSettingsData?> readAppSettings(String fileName) async {
    try {
      final path = await _localPath;
      File file = File('$path/$fileName');

      final jsonData = await file.readAsString();

      final decodedData = json.decode(jsonData);

      Map<String, dynamic> data = fixAppSettingsData(decodedData, path);

      final dataMap = AppSettingsData.fromJson(data);

      return dataMap;
    } catch (e) {
      if (kDebugMode) {
        print('CAMPAIGN STORAGE FAILED');
        print('readJSON error: $e');
      }

      return null;
    }
  }

  Future<File> writeAppSettingsJSON(
    AppSettingsData appSettingsData,
    String fileName,
  ) async {
    final path = await _localPath;

    File file = File('$path/$fileName');

    String jsonData = jsonEncode(appSettingsData);

    return file.writeAsString(jsonData);
  }

  String getCampaignJSON(CampaignData data) {
    return jsonEncode(data);
  }

  CampaignData campaignJSONToObject(String jsonData) {
    var data = json.decode(jsonData);
    final dataMap = CampaignData.fromJson(data);
    return dataMap;
  }

  String appSettingsToJSON(AppSettingsData data) {
    return jsonEncode(data);
  }

  AppSettingsData appSettingsJSONToObject(String jsonData) {
    var data = json.decode(jsonData);
    final dataMap = AppSettingsData.fromJson(data);
    return dataMap;
  }
}
