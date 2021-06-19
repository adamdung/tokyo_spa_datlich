import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tokyo_spa_datlich/pages/home.dart';
import 'package:tokyo_spa_datlich/pages/tai_khoan.dart';
import 'package:tokyo_spa_datlich/code_dung_lai/uidata.dart';
import 'package:tokyo_spa_datlich/pages/dat_lich.dart';

class MainPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxInt pageIndex = 0.obs;
  RxList<Widget> pageList = [
    HomePage(),
    DatLich(),
    TaiKhoanPage(),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: pageList[pageIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 25,
            unselectedItemColor: UiData.textColor,
            type: BottomNavigationBarType.fixed,
            backgroundColor: UiData.barColor,
            selectedIconTheme: IconThemeData(color: UiData.mainColor),
            selectedFontSize: 10,
            unselectedFontSize: 10,
            fixedColor: Color(0xffC29131),
            currentIndex: pageIndex.value,
            onTap: (value) {
              pageIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today), label: "Đặt lịch"),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(_auth.currentUser.photoURL),
                ),
                label: "Tài khoản",
              ),
            ],
          )),
    );
  }
}
