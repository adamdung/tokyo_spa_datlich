import 'package:flutter/material.dart';
import 'package:tokyo_spa_datlich/code_dung_lai/uidata.dart';

Widget thongTinDatLich() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: UiData.barColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.only(left: 61, right: 16, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thông tin đặt lịch',
                style: TextStyle(color: UiData.textColor, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '- Thời gian : 9:30 -10:30 ngày 31/12/2021',
                style: TextStyle(color: UiData.textColor, fontSize: 10),
              ),
              Text(
                '- Kĩ thuật viên : Huyền mít',
                style: TextStyle(color: UiData.textColor, fontSize: 10),
              ),
              Text(
                '- Thời gian làm dịch vụ: khoảng 1 h',
                style: TextStyle(color: UiData.textColor, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
