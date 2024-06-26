import 'dart:convert';

import 'package:mini_solo/data/campaign_data.dart';

dynamic fixJSONData(dynamic initialData, dynamic data) {
  initialData.forEach((dynamic k, dynamic v) {
    var dataKey = data[k];
    if (dataKey == null) {
      data[k] = v;
    }
  });
  return data;
}

Map<String, dynamic> convertCampaignToJSON(CampaignData campaignData) {
  String initialEncodedData = jsonEncode(campaignData);
  return jsonDecode(initialEncodedData);
}
