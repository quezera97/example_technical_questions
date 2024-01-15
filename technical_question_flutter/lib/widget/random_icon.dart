import 'dart:math';

import 'package:flutter/material.dart';

IconData getRandomIcon() {
  Random random = Random();
  List<IconData> icons = [
    Icons.abc,
    Icons.ac_unit,
    Icons.accessibility,
    Icons.account_balance,
    Icons.account_balance_wallet,
    Icons.account_box,
    Icons.account_circle,
    Icons.adb,
    Icons.add,
    Icons.add_a_photo,
    Icons.add_alarm,
    Icons.add_alert,
    Icons.add_box,
    Icons.add_circle,
    Icons.add_comment,
    Icons.add_location,
    Icons.add_photo_alternate,
    Icons.add_shopping_cart,
    Icons.one_k,
    Icons.two_wheeler,
    Icons.threed_rotation,
    Icons.padding,
    Icons.label,
    Icons.mail,
    Icons.nat,
    Icons.baby_changing_station,
    Icons.vaccines,
    Icons.cabin,
    Icons.one_x_mobiledata,
    Icons.zoom_in,
    Icons.kayaking,
    Icons.javascript,
  ];

  int index = random.nextInt(icons.length);
  return icons[index];
}
