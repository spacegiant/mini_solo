import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/data/campaign_data.dart';

import '../../data/app_state.dart';
import '../gap.dart';

class ImportManager extends StatefulWidget {
  const ImportManager({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<ImportManager> createState() => _ImportManagerState();
}

class _ImportManagerState extends State<ImportManager> {
  late TextEditingController _appSettingsJSONController;
  late TextEditingController _campaignNameController;
  late TextEditingController _campaignSettingsJSONController;
  bool? userWantsToSwitch = false;

  final String separatorCharacter = '|';

  @override
  void initState() {
    super.initState();
    _appSettingsJSONController = TextEditingController();
    _campaignNameController = TextEditingController();
    _campaignSettingsJSONController = TextEditingController();
  }

  @override
  void dispose() {
    _appSettingsJSONController.dispose();
    _campaignNameController.dispose();
    _campaignSettingsJSONController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void clearAll() {
      _campaignNameController.text = '';
      _campaignSettingsJSONController.text = '';
      _appSettingsJSONController.text = '';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Text(
            'Import Data',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          const Gap(),
          const Text('App Settings JSON'),
          SingleChildScrollView(
            child: CupertinoTextField(
              controller: _appSettingsJSONController,
              textAlignVertical: TextAlignVertical.top,
              minLines: 3,
              maxLines: 3,
              clearButtonMode: OverlayVisibilityMode.editing,
            ),
          ),
          const Gap(),
          const Divider(),
          const Gap(),
          const Text('Campaign Name'),
          CupertinoTextField(
            controller: _campaignNameController,
            textAlignVertical: TextAlignVertical.top,
            clearButtonMode: OverlayVisibilityMode.editing,
          ),
          const Gap(),
          const Text('Campaign JSON'),
          SingleChildScrollView(
            child: CupertinoTextField(
              controller: _campaignSettingsJSONController,
              textAlignVertical: TextAlignVertical.top,
              minLines: 3,
              maxLines: 3,
              clearButtonMode: OverlayVisibilityMode.editing,
            ),
          ),
          const Gap(),
          const Text('Status here'),
          const Gap(),
          if (widget.appState.currentCampaign == '')
            Row(
              children: [
                const Text('Switch to imported campaign?'),
                CupertinoCheckbox(
                    value: userWantsToSwitch,
                    onChanged: (value) {
                      setState(() {
                        userWantsToSwitch = !userWantsToSwitch!;
                      });
                    }),
              ],
            ),
          Row(
            children: [
              CupertinoButton(
                  color: kSubmitColour,
                  child: const Text('Import'),
                  onPressed: () {
                    // TODO VALIDATE FIRST
                    if (_appSettingsJSONController.text.isNotEmpty) {
                      AppSettingsData importedData = widget.appState.storage
                          .appSettingsJSONToObject(
                              _appSettingsJSONController.text);

                      importedData.currentCampaign =
                          widget.appState.currentCampaign!;

                      widget.appState.setAppSettingsData(importedData);
                    }

                    // TODO VALIDATE FIRST
                    if (_campaignNameController.text.isNotEmpty &&
                        _campaignSettingsJSONController.text.isNotEmpty) {
                      CampaignData importedData = widget.appState.storage
                          .campaignJSONToObject(
                              _campaignSettingsJSONController.text);

                      if (userWantsToSwitch == false) {
                        widget.appState.storage.writeJSON(
                            importedData, '${importedData.filename}.json');
                      } else {
                        widget.appState.setCurrentCampaign(importedData.name);
                        widget.appState.setCurrentCampaign(importedData.name);
                        widget.appState.saveAppSettingsDataToDisk();
                        widget.appState.setCampaignData(importedData);
                      }

                      // TODO VALIDATE FIRST
                      clearAll();
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }
}
