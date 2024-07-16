import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';
import 'package:provider/provider.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../data/data_structures/journal_entry.dart';
import '../../widgets/gap.dart';
import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';

class NewPersonMenu extends StatefulWidget {
  const NewPersonMenu({super.key});

  @override
  State<NewPersonMenu> createState() => _NewPersonMenuState();
}

class _NewPersonMenuState extends State<NewPersonMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;
  // PERSON STATE
  String sex = '...';
  String gender = '...';
  String title = '...';
  String firstName = '...';
  String lastName = '...';
  String appearance = '...';
  String background = '...';
  String identity = '...';
  String motivation = '...';
  String personality = '...';
  String skills = '...';
  String traitsAndFlaws = '...';
  String demeanour = '...';
  String trueSelf = '...';

  void updatePerson(String field, String value) {}

  void updateState(JournalEntry result) {
    setState(() {
      line1 = result.line1!;
      line2 = result.line2;
      line3 = null;
      type = result.type;
    });
  }

  @override
  Consumer build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
        return ViewWrapper(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RandomiserButton(
                        label: 'Sex',
                        value: sex,
                        onTap: () {
                          setState(() {
                            sex = 'female';
                          });
                        },
                        onLongPress: () {
                          toggleShowPopup2(
                              child: const Text('EDIT FIELD'),
                              context: context);
                        },
                      ),
                    ),
                    const Gap(),
                    Expanded(
                      flex: 2,
                      child: RandomiserButton(
                        label: 'Title',
                        value: title,
                        onTap: () {},
                        onLongPress: () {
                          toggleShowPopup2(
                              child: const Text('EDIT FIELD'),
                              context: context);
                        },
                      ),
                    ),
                  ],
                ),
                const Gap(),
                RandomiserButton(
                  label: 'First name',
                  value: firstName,
                  onTap: () {},
                  onLongPress: () {
                    toggleShowPopup2(
                        child: const Text('EDIT FIELD'), context: context);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RandomiserButton(
                  label: 'Title',
                  value: '...',
                  onTap: () {},
                  onLongPress: () {},
                ),
                const Gap(),
                RandomiserButton(
                  label: 'First',
                  value: '...',
                  flex: 2,
                  onTap: () {},
                  onLongPress: () {},
                ),
                const Gap(),
                RandomiserButton(
                  label: 'Last',
                  value: '...',
                  flex: 2,
                  onTap: () {},
                  onLongPress: () {},
                ),
              ],
            ),
          ),
          ListButton(
              label: 'Save',
              onPressed: () {
                // TODO
              }),
          const Gap(),
        ]);
      },
    );
  }
}

class RandomiserButton extends StatelessWidget {
  const RandomiserButton({
    super.key,
    required this.label,
    required this.value,
    this.flex = 1,
    required this.onTap,
    required this.onLongPress,
  });

  final String label;
  final String value;
  final int flex;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        color: CupertinoColors.systemYellow,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: CupertinoColors.black,
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.refresh,
                    color: CupertinoColors.black,
                    size: 12.0,
                  )
                ],
              ),
              Text(
                value,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
