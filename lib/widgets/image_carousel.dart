import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget imageCarousel() {
  return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('bannerQuangCao')
          .doc('Mt9H4EeF2owYwqpwwQuy')
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError)
          return Center(
            child: Text(''),
          );
        Map<String, dynamic> documentData = snapshot.data.data();
        List imageList = documentData['anh'];

        return Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
            height: 170,
            child: Carousel(
              // borderRadius: true,
              // radius: Radius.circular(20),
              animationDuration: Duration(milliseconds: 400),
              showIndicator: false,
              dotBgColor: null,
              boxFit: BoxFit.cover,
              images: [
                NetworkImage(imageList[0]),
                NetworkImage(imageList[1]),
                NetworkImage(imageList[2]),
                NetworkImage(imageList[3]),
              ],
              autoplay: true,
              dotSize: 4,
              indicatorBgPadding: 4,
            ));
      });
}
