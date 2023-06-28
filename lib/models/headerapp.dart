import 'package:flutter/material.dart';

Widget appName() {
  return const Padding(
    padding: EdgeInsets.fromLTRB(10, 20, 8, 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "โปรแกรมคำนวณสูตรอาหารเลี้ยงปลา",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text("Thaksin Catfish Feed Formulation Ver. 1.0",
            style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}

Row createHeaderLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      createLogoContainer(
          120, 80, 8.0, "assets/images/logo_a.jpg", BoxFit.cover),
      createLogoContainer(
          70, 100, 4.0, "assets/images/tsu_logo1.png", BoxFit.fill),
      createLogoContainer(
          150, 80, 8.0, "assets/images/sci_logo1.png", BoxFit.fill),
    ],
  );
}

Container createLogoContainer(
    double width, double height, double padding, String img, BoxFit boxfit) {
  return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: Image.asset(img, fit: boxfit));
}

Widget logoApp() {
  return Container(
    padding: const EdgeInsets.all(16),
    height: 250,
    child: Image.asset(
      "assets/images/my_logo.jpg",
      fit: BoxFit.contain,
    ),
  );
}
