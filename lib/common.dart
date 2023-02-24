import 'package:figmadesign/model/cardata.dart';
import 'package:figmadesign/model/contactdata.dart';
import 'package:figmadesign/model/userdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common {
  static Widget customText(
      {String? text, double? fontSize, FontWeight? fontWeight, Color? color}) {
    return Text(text!,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ));
  }

  static Widget containerButton({
    Color? color,
    BorderRadiusGeometry? borderRadius,
    Widget? child,
  }) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }

  static Widget customContainer(
      {Color? color,
      BorderRadiusGeometry? borderRadius,
      Widget? child,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding}) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }

  static Widget textField(
      {TextEditingController? controller,
      String? text,
      Widget? prefixIcon,
      Color? fillColor}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        labelText: text,
        fillColor: fillColor,
        filled: true,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  List<UserData> userList = [];

  var image = [
    "assets/screen2/icon/image.png",
    "assets/screen2/icon/image.png"
  ];
  var svg1Image = [
    "assets/screen2/icon/s1.svg",
    "assets/screen2/icon/s1.svg",
  ];
  var sImage = [
    "assets/screen2/icon/food.svg",
    "assets/screen2/icon/food.svg",
  ];
  var tittle = ["Today", "Yesterday"];
  var userName = ["Sarah", 'lara'];
  var shopName = ["Shopping", 'Shopping'];
  var foodName = ["Food Delivery", 'Food Delivery'];

  List<UserData> getData() {
    for (int i = 0; i < image.length; i++) {
      UserData userData = UserData();
      userData.image = image[i];
      userData.tittle = tittle[i];
      userData.userName = userName[i];
      userData.shopName = shopName[i];
      userData.foodName = foodName[i];
      userData.svg1Image = svg1Image[i];
      userData.sImage = sImage[i];
      userList.add(userData);
    }
    return userList;
  }

  List<User> uList = [];
  var name = ["Edwardo", "Jasson", "Kemod", "Dasep"];
  var eName = ["E", "J", "K", "D"];
  var userImage = [
    "assets/screen3/icon/image1.png",
    "assets/screen3/icon/image2.png",
    "assets/screen3/icon/i3.png",
    "assets/screen3/icon/i4.png",
  ];
  var mobile = [62898023450, 62898023450, 62898023450, 62898023450];

  List<User> setData() {
    for (int i = 0; i < name.length; i++) {
      User user = User();
      user.name = name[i];
      user.mobile = mobile[i];
      user.image = userImage[i];
      user.eName = eName[i];
      uList.add(user);
    }
    return uList;
  }

  List<Car> cList = [];
  var cname = ["Gotham Car Reparation", "Gotham Car", "Gotham auto moto","Gotham Car"];
  var cImage = [
    "assets/screen4/icon/car.png",
    "assets/screen4/icon/auto.png",
    "assets/screen4/icon/auto.png",
    "assets/screen4/icon/car.png",
  ];
  var cTime = ["8am-5am", "8am-5am", "8am-5am","8am-5am"];
  var cAddress = ["surat", "surat", "valsad","Bardoli"];

  List<Car> carData() {
    for (int i = 0; i < name.length; i++) {
      Car car = Car();
      car.name = cname[i];
      car.image = cImage[i];
      car.time = cTime[i];
      car.address = cAddress[i];
      cList.add(car);
    }
    return cList;
  }
}
