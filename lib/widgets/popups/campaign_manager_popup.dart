import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          return snapshot.hasData
              ? PopupLayout(
                  header: const PopupLayoutHeader(label: kCampaignManagerTitle),
                  body: SizedBox(
                    width: 400.0,
                    child: Column(
                      children: [
                        for (var item in snapshot.data)
                          campaignManagerRow(item),
                      ],
                    ),
                  ),
                  // TODO To complete this popup
                  footer: const Text('BUTTON HERE'),
                )
              // TODO change Text to use a Loader widget
              : const Text('Loading...');
        });
  }

  Row campaignManagerRow(item) {
    return Row(
      children: [
        Text(getLabel(item.path)),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            widget.appState.loadCampaign(getLabel(item.path));
          },
          child: Icon(CupertinoIcons.floppy_disk),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // widget.appState.loadCampaign(getLabel(item.path));
          },
          child: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            widget.appState.deleteCampaign(item.path);
          },
          child: Icon(CupertinoIcons.delete),
        ),
      ],
    );
  }
}

String getLabel(String text) {
  List<String> textBits = text.split('/');

  return textBits[textBits.length - 1];
}
