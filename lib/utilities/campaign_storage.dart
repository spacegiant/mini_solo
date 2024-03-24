import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mini_solo/utilities/campaign_data.dart';
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
