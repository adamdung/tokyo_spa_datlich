import 'package:flutter/material.dart';

import '../code_dung_lai/uidata.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onpressed;

  const MyButton({Key key, this.btnText, this.onpressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      child: FlatButton(
        color: UiData.mainColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        onPressed: onpressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(btnText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
