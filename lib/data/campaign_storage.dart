import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:path_provider/path_provider.dart';

class CampaignListItem {
  String campaignName;
  String path;

  CampaignListItem(this.campaignName, this.path) {}
}

class CampaignStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<List<FileSystemEntity>> get getCampaignsList async {
    final directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> campaigns = [];

    await for (var entity in directory.list(
      recursive: false,
      followLinks: false,
    )) {
      campaigns.add(entity);
    }
    return campaigns;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/sampleCampaign.json');
  }

  Future<CampaignData?> readJSON() async {
    try {
      final file = await _localFile;
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

  Future<File> writeJSON(CampaignData data) async {
    final file = await _localFile;
    print(file);

    // Convert MAP to String
    String jsonData = jsonEncode(data);

    // Write the file
    return file.writeAsString(jsonData);
  }
}
