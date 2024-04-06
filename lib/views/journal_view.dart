import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';
import 'package:provider/provider.dart';

import '../utilities/app_state.dart';
import '../utilities/campaign_data.dart';
import '../utilities/convert_for_journal.dart';
import '../utilities/test_scene.dart';
import '../widgets/gap.dart';
import '../widgets/journal/journal.dart';
import '../widgets/speech_bubble/bubble_text.dart';
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
  late String type;
  late String line1;
  late String? line2;
  late String? line3;

  ReturnObject({
    required this.type,
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
  String type = '...';

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
                      widget: BubbleText(
                      lines: [line1, line2, line3],
                      type: type,
                    ))
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

                    appState.addJournalEntry(
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
              // combat,
              // social,
              // exploration,
              // travel,
              // investigate,
            ]),
          ),
        ],
      );
    });
  }
}
