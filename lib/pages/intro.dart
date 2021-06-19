import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokyo_spa_datlich/Login_with_google/authentification.dart';

import 'package:tokyo_spa_datlich/pages/main_page.dart';
import 'package:tokyo_spa_datlich/widgets/button.dart';

import '../code_dung_lai/uidata.dart';
import 'home.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Future<void> signInWithGoogle() async {
    await Authentification().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiData.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/main.png",
                      ),
                      fit: BoxFit.contain)),
              height: MediaQuery.of(context).size.height * .45,
            ),
            Text("Chào mừng bạn đến với\nTokyo beauty spa",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: UiData.textColor,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    fontSize: 22,
                    letterSpacing: 1.3)),
            Text(
              "Nơi gửi gắm niềm tin của phái đẹp",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.8, letterSpacing: 1.3, color: UiData.textColor),
            ),
            MyButton(btnText: "Bắt đầu thôi nào !", onpressed: signInWithGoogle)
          ],
        ),
      ),
    );
  }
}
