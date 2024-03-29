import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:tokyo_spa_datlich/pages/intro.dart';
import 'package:tokyo_spa_datlich/pages/main_page.dart';

class WidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if (user == null) {
      return IntroPage();
    }
    return MainPage();
  }
}
