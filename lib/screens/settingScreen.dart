import 'package:coocking_time/widgets/alertDialog.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../function.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = 'SettingScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              buildCardOfSetting(),
              buildCardOfSetting(
                  function1: 'Mode',
                  function2: 'Light Mode',
                  onPressed: () {
                    return buildShowDialog(context);
                  }),
            ],
          )),
    );
  }

  Column buildCardOfSetting(
      {String function1 = 'Language',
      String function2 = 'English',
      Function onPressed}) {
    return Column(
      children: [
        ListTile(
          title: Text(function1, style: kStyleSmall),
          subtitle: Text(function2),
          onTap: onPressed,
        ),
        Divider(),
      ],
    );
  }
}
