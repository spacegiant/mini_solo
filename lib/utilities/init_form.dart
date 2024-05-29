import 'package:flutter/cupertino.dart';

import '../constants.dart';

class InitForm extends StatefulWidget {
  const InitForm({
    super.key,
    required this.initCampaignData,
  });

  final Function(String campaignName) initCampaignData;

  @override
  State<InitForm> createState() => _InitFormState();
}

class _InitFormState extends State<InitForm> {
  // create key to identify this form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CupertinoFormSection(
        margin: const EdgeInsets.all(8.0),
        header: const Text(kInitFormHeader),
        children: [
          CupertinoFormRow(
            child: CupertinoTextFormFieldRow(
              // TODO: Handle overly long campaign names
              // TODO: Only allow alpha and numerical
              autocorrect: false,
              placeholder: 'Type here',
              textCapitalization: TextCapitalization.sentences,
              onFieldSubmitted: (campaignName) {
                setState(() {
                  widget.initCampaignData(campaignName);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
