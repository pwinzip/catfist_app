import 'package:catfishfeedapp/models/headerapp.dart';
import 'package:catfishfeedapp/pages/nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          createHeaderLogo(),
          appName(),
          logoApp(),
          startButton(context),
          devByText(),
        ],
      )),
    );
  }

  Widget devByText() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Application Thaksin Catfish Feed Formulation Ver. 1.0",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "พัฒนาโดย\nโครงการวิจัยการพัฒนานวัตกรรมการเลี้ยงปลาดุกลูกผสมเพื่อผลิตเป็นวัตถุดิบสำหรับแปรรูปผลิตภัณฑ์ปลาดุกร้า บพท. 2566 \n คณะวิทยาศาสตร์ มหาวิทยาลัยทักษิณ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Container startButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * .7,
      height: 80,
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NutritionPage(),
                ));
          },
          child: const Text("เริ่มต้น")),
    );
  }
}
