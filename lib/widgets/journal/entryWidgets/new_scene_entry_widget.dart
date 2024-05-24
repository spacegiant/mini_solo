import 'package:flutter/material.dart';

class NewSceneEntryWidget extends StatelessWidget {
  const NewSceneEntryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black.withOpacity(0.5),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'New Scene',
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ));
  }
}
