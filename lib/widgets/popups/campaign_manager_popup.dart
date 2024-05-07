import 'dart:io';

import 'package:flutter/cupertino.dart';

class CampaignManager extends StatefulWidget {
  const CampaignManager({
    super.key,
    required this.getCampaignList,
  });

  final Future<List<FileSystemEntity>> getCampaignList;

  @override
  State<CampaignManager> createState() => _CampaignManagerState();
}

class _CampaignManagerState extends State<CampaignManager> {
  @override
  Widget build(
    BuildContext context,
  ) {
    // TODO: POC GET ALL FILES IN DIRECTORY
    Future<List<FileSystemEntity>> campaigns = widget.getCampaignList;
    // campaigns.then((campaigns) {
    //   print('---');
    //   print(campaigns[0].path);
    //   print(campaigns[0].absolute);
    //   print(campaigns[0].isAbsolute);
    //   print(campaigns[0].parent);
    //   print(campaigns[0].uri);
    //   print(campaigns[0].hashCode);
    // });
    return FutureBuilder(
        future: campaigns,
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          // TODO: Tests for this
          if (snapshot.hasData) {
            // TODO: iterate over list
            // return Text('${snapshot.data}');
            var test = snapshot.data.forEach((item) => print(item));
            // print(test.runtimeType);
            print(snapshot.data[0].path);
            return Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                children: [
                  for (var item in snapshot.data) Text(getLabel(item.path))
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
}

String getLabel(String text) {
  List<String> textBits = text.split('/');

  return textBits[textBits.length - 1];
}
