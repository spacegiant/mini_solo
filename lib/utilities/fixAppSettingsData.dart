Map<String, dynamic> fixAppSettingsData(
    Map<String, dynamic> data, String localPath) {
  return {
    'currentCampaign': data['currentCampaign'] ?? '',
    'dataPath': localPath,
    'randomTables': data['randomTables'] ?? [],
    'expandedList': data['expandedList'] ?? [],
    'actionLists': data['actionLists'] ?? [],
  };
}
