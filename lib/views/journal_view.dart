import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';
import 'package:provider/provider.dart';

import '../utilities/app_state.dart';
import '../utilities/campaign_data.dart';
import '../utilities/convert_for_journal.dart';
import '../widgets/gap.dart';
import '../widgets/journal.dart';
import '../widgets/speech_bubble/speech_bubble.dart';

enum SceneState {
  expected,
  altered,
  interrupt,
}

Map<SceneState, String> sceneLabels = {
  SceneState.expected: 'Expected Scene',
  SceneState.altered: 'Altered Scene',
  SceneState.interrupt: 'Interrupt Scene'
};

class SceneStateResult {
  final String outcome = '';
  final String info = '';

  SceneStateResult(
    String outcome,
    String info,
  ) {
    outcome = this.outcome;
    info = this.info;
  }
}

// TODO: Rename this
class ReturnObject {
  late String line1;
  late String? line2;
  late String? line3;

  ReturnObject({
    required this.line1,
    this.line2,
    this.line3,
  });
}

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      bool showFutureFeatures =
          appState.campaignData!.settings.general.showFutureSettings;
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          appState.useJournal
              ? Journal(items: appState.campaignData!.journal)
              : const SizedBox.shrink(),
          Expanded(
            flex: 1,
            child: ViewWrapper(children: [
              !appState.useJournal
                  ? SpeechBubble(
                      line1: line1,
                      line2: line2,
                      line3: line3,
                    )
                  : const SizedBox.shrink(),
              ListButton(
                  label: 'Test Your Expected Scene',
                  onPressed: () {
                    ReturnObject test = testScene(context);

                    // For Bubble
                    setState(() {
                      line1 = test.line1;
                      line2 = test.line2;
                      line3 = test.line3;
                    });

                    appState.campaignData?.journal.add(
                      JournalEntryItem(
                        isFavourite: false,
                        label: 'Test Scene',
                        title: line1,
                        detail: convertToJournalEntry(
                          test.line1,
                          test.line2,
                          test.line3,
                        ),
                        type: JournalEntryTypes.oracle,
                      ),
                    );
                    appState.saveCampaignDataToDisk();
                  }),
              // TODO: Replace this with menuSpacer or other way round
              const Gap(),
              if (showFutureFeatures)
                ListButton(
                  label: 'Fate Check',
                  onPressed: () {
                    appState.setPopupLabel(PopupLabels.fate);
                    appState.toggleShowPopup();
                  },
                ),
              if (showFutureFeatures)
                ListButton(
                  label: 'End Scene',
                  onPressed: () {
                    appState.setPopupLabel(PopupLabels.endScene);
                    appState.toggleShowPopup();
                  },
                ),
              if (showFutureFeatures) const Gap(),
              if (showFutureFeatures)
                ListButton(
                  label: 'Combat',
                  onPressed: () {
                    appState.setPopupLabel(PopupLabels.combat);
                    appState.toggleShowPopup();
                  },
                ),
              if (showFutureFeatures)
                ListButton(
                  label: 'Social',
                  onPressed: () {
                    appState.setPopupLabel(PopupLabels.social);
                    appState.toggleShowPopup();
                  },
                ),
              if (showFutureFeatures)
                ListButton(
                  label: 'Exploration',
                  onPressed: () {
                    appState.setPopupLabel(PopupLabels.exploration);
                    appState.toggleShowPopup();
                  },
                ),
              if (showFutureFeatures)
                ListButton(
                  label: 'Travel',
                  onPressed: () {
                    appState.setPopupLabel(PopupLabels.travel);
                    appState.toggleShowPopup();
                  },
                ),
              if (showFutureFeatures)
                ListButton(
                  label: 'Investigate',
                  onPressed: () {
                    appState.setPopupLabel(PopupLabels.investigation);
                    appState.toggleShowPopup();
                  },
                ),
            ]),
          ),
        ],
      );
    });
  }

  ReturnObject testScene(BuildContext context) {
    int d10 = Random().nextInt(10) + 1;
    var chaosFactor = context.read<AppState>().chaosFactor;

    if (d10 > chaosFactor) {
      return ReturnObject(
        line1: 'Expected',
        line3: 'd10 roll = $d10 > CF $chaosFactor',
      );
    }
    if (d10.isEven) {
      return ReturnObject(
        line1: 'Altered',
        line3: 'd10 roll = $d10 (Odd) < CF $chaosFactor',
      );
    } else {
      return ReturnObject(
        line1: 'Interrupt',
        line3: 'd10 roll = $d10 (Even) < CF $chaosFactor',
      );
    }
  }
}
