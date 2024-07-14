import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/label_and_input.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../main.dart';
import '../gap.dart';

class CampaignManager extends StatefulWidget {
  const CampaignManager({
    super.key,
    required this.getCampaignList,
    required this.appState,
    required this.initCampaignData,
  });

  final Future<List<FileSystemEntity>> getCampaignList;
  final AppState appState;
  final void Function(String campaignName) initCampaignData;

  @override
  State<CampaignManager> createState() => _CampaignManagerState();
}

class _CampaignManagerState extends State<CampaignManager> {
  TextEditingController newCampaignController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    AppState appState = widget.appState;
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
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var item in snapshot.data) campaignManagerRow(item),
                    ],
                  ),
                  // TODO To complete this popup
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: LabelAndInput(
                            label: 'New Campaign',
                            controller: newCampaignController,
                            onChanged: (value) {
                              setState(() {
                                newCampaignController.text = value;
                              });
                            }),
                      ),
                      const Gap(),
                      CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          color: kSubmitColor,
                          child: Text('Create'),
                          onPressed: () {
                            String text =
                                newCampaignController.value.text.trim();
                            if (text != '') {
                              widget.initCampaignData(text);
                              newCampaignController.text = '';
                            }
                          })
                    ],
                  ),
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
          child: const Icon(CupertinoIcons.floppy_disk),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // widget.appState.loadCampaign(getLabel(item.path));
          },
          child: const Icon(CupertinoIcons.pencil_ellipsis_rectangle),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            widget.appState.deleteCampaign(item.path);
            // TODO if is current campaign do this...
            RestartWidget.restartApp(context);
          },
          child: const Icon(CupertinoIcons.delete),
        ),
      ],
    );
  }
}

String getLabel(String text) {
  List<String> textBits = text.split('/');

  return textBits[textBits.length - 1];
}
