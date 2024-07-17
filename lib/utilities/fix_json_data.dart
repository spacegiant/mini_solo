import 'dart:convert';

import 'package:mini_solo/data/campaign_data.dart';

dynamic fixCampaignJSONData(dynamic initialData, dynamic data) {
  initialData.forEach((dynamic k, dynamic v) {
    // EXPERIMENT FINISHED
    //
    // if (data['settings']['general']['hiddenEntryTypes'] == null) {
    //   data['settings']['general']['hiddenEntryTypes'] = [];
    // }
    // if (data['newScene'] == null) data['newScene'] = [];
    // var showNotes = data['settings']['general']['showNotes'];
    // showNotes ??= true;
    if (data['settings']['general']['showNotes'] == null) {
      data['settings']['general']['showNotes'] = true;
    }

    var dataKey = data[k];
    if (dataKey == null) {
      data[k] = v;
    } else {
      // print('$k >>> $dataKey}');
    }
    if (dataKey is List) {
      // print('LIST');
    } else if (dataKey is Map) {
      // print('MAP');
    }
  });
  return data;
}

Map<String, dynamic> convertCampaignToJSON(CampaignData campaignData) {
  String initialEncodedData = jsonEncode(campaignData);
  return jsonDecode(initialEncodedData);
}
