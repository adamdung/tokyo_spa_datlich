import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tokyo_spa_datlich/widgets/image_carousel.dart';

import 'package:tokyo_spa_datlich/widgets/specialist_column.dart';

import '../code_dung_lai/uidata.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    imageCarousel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screen_size_width = MediaQuery.of(context).size.width;
    final screen_size_height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: UiData.backgroundColor,
        appBar: AppBar(
          backgroundColor: UiData.barColor,
          elevation: 10,
          leading: IconButton(
              icon: Icon(Icons.notifications, color: Colors.orange),
              onPressed: () {}),
          title: Image.asset(
            'images/tokyo_spa.png',
            fit: BoxFit.contain,
            height: 40,
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 12, bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.brown[800],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                alignment: Alignment.center,
                // color: UiData.mainColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tài khoản: 0đ',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
                width: screen_size_width,
                padding: EdgeInsets.only(top: 5, left: 16, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          _auth.currentUser.photoURL,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _auth.currentUser.displayName,
                              style: TextStyle(
                                color: UiData.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chưa có hạng thành viên',
                                  style: TextStyle(
                                      color: UiData.textColor, fontSize: 10),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Đăng kí ngay >',
                                      style: TextStyle(
                                          color: UiData.mainColor,
                                          fontSize: 10),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Divider(
              color: UiData.mainColor,
            ),
            Expanded(
              child: Container(
                width: screen_size_width,
                height: screen_size_height,
                // padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      imageCarousel(),
                      SizedBox(height: 15),

                      // ------Kĩ thuật viên ----------
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Text("DỊCH VỤ",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: UiData.textColor))),
                              FlatButton(
                                  onPressed: () {},
                                  child: Text("View All",
                                      style: TextStyle(color: Colors.white)))
                            ]),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 230,
                            width: screen_size_width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SpecialistColumn(
                                    specImg: "images/braid2.jpg",
                                    specName: "Anny Roy"),
                                SizedBox(width: 12),
                                SpecialistColumn(
                                    specImg: "images/profile.jpg",
                                    specName: "Joy Roy"),
                                SizedBox(width: 12),
                                SpecialistColumn(
                                    specImg: "images/braid3.jpg",
                                    specName: "Patience Roy"),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
