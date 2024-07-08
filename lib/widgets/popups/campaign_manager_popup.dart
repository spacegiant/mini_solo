import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

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
    // TODO Finish this functionality. Users should be a able to switch and manage campaigns
    return FutureBuilder(
        future: campaigns,
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          return PopupLayout(
            header: const PopupLayoutHeader(label: kCampaignManagerTitle),
            body: SizedBox(
              width: 400.0,
              child: Column(
                children: [
                  for (var item in snapshot.data) campaignManagerRow(item),
                ],
              ),
            ),
            // TODO To complete this popup
            footer: const Text('BUTTON HERE'),
          );
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
