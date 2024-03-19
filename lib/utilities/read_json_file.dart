import 'dart:convert';
import 'package:flutter/services.dart' as root_bundle;

class ReadJsonFile {
  static Future<Map> readJsonData({required String path}) async {
    // read json file
    final jsonData = await root_bundle.rootBundle.loadString(path);

    // decode json data as list
    final list = json.decode(jsonData) as Map;

    // map json and initialize
    // using DataModel
    return list;
  }
}
