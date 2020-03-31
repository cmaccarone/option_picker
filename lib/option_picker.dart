library option_picker;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionPicker {
  OptionPicker.show(
      {@required this.title,
      this.subtitle,
      this.firstButtonText,
      this.secondButtonText,
      this.cancelText = "Cancel",
      @required this.onPressedFirst,
      @required this.onPressedSecond,
      @required this.context}) {
    _show(context);
  }

  BuildContext context;
  String title;
  String subtitle;
  String cancelText;
  String firstButtonText;
  String secondButtonText;
  Function onPressedFirst;
  Function onPressedSecond;
  bool topIsDefault;

  Future<AlertDialog> _showAlertDialog(BuildContext context) async {
    // set up the buttons
    Widget firstButton = FlatButton(
      child: Text(firstButtonText),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        onPressedFirst();
      },
    );
    Widget secondButton = FlatButton(
      child: Text(secondButtonText),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        onPressedSecond();
      },
    );
    Widget cancelButton = FlatButton(
      child: Text(cancelText),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: [firstButton, secondButton, cancelButton],
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<Widget> _show(BuildContext context) async {
    return Platform.isIOS
        ? showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
                  message: Text(subtitle),
                  title: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  ),
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    isDefaultAction: false,
                    isDestructiveAction: false,
                    child: Text(cancelText),
                  ),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        onPressedFirst();
                      },
                      isDestructiveAction: false,
                      child: Text(firstButtonText),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        onPressedSecond();
                      },
                      isDestructiveAction: false,
                      child: Text(secondButtonText),
                    )
                  ],
                ))
        : await _showAlertDialog(context);
  }
}
