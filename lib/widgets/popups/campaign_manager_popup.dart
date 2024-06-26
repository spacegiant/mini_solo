import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../../data/app_state.dart';

class CampaignManager extends StatefulWidget {
  const CampaignManager({
    super.key,
    required this.getCampaignList,
    required this.appState,
  });

  final Future<List<FileSystemEntity>> getCampaignList;
  final AppState appState;

  @override
  State<CampaignManager> createState() => _CampaignManagerState();
}

class _CampaignManagerState extends State<CampaignManager> {
  @override
  Widget build(
    BuildContext context,
  ) {
    Future<List<FileSystemEntity>> campaigns = widget.getCampaignList;
    return FutureBuilder(
        future: campaigns,
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          // TODO: Tests for this
          if (snapshot.hasData) {
            return SizedBox(
              width: 400.0,
              child: Column(
                children: [
                  const Text(kCampaignManagerTitle),
                  for (var item in snapshot.data) campaignManagerRow(item),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            // TODO: What to do here?
            return const Text('CAMPAIGN MANAGER');
          } else {
            // TODO: Loading state
            return const Text('CAMPAIGN MANAGER');
          }
        });
  }

  CupertinoButton campaignManagerRow(item) {
    return CupertinoButton(
      onPressed: () {
        widget.appState.loadCampaign(getLabel(item.path));
      },
      child: Text(
        getLabel(item.path),
      ),
    );
  }
}

String getLabel(String text) {
  List<String> textBits = text.split('/');

  return textBits[textBits.length - 1];
}
