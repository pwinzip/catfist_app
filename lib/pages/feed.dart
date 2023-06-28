import 'package:catfishfeedapp/models/headerapp.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage(
      {super.key,
      required this.fish,
      required this.soybean,
      required this.chicken,
      required this.brokenrice,
      required this.rice,
      required this.potato,
      required this.palm,
      required this.corn,
      required this.vitamin,
      required this.oil,
      required this.methionine,
      required this.p18p21});

  final double fish;
  final double soybean;
  final double chicken;
  final double brokenrice;
  final double rice;
  final double potato;
  final double palm;
  final double corn;
  final double vitamin;
  final double oil;
  final double methionine;
  final double p18p21;
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  TextEditingController feedController = TextEditingController();

  bool _isCalucalted = false;

  double fishAmount = 0,
      soybeanAmount = 0,
      chickenAmount = 0,
      brokenriceAmount = 0,
      riceAmount = 0,
      potatoAmount = 0,
      palmAmount = 0,
      cornAmount = 0,
      vitaminAmount = 0,
      oilAmount = 0,
      methionineAmount = 0,
      p18p21Amount = 0,
      sum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        children: [
          createHeaderLogo(),
          appName(),
          createInputFeed(),
          _isCalucalted
              ? Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                            const Expanded(
                                child: Text(
                              "ปริมาณวัตถุดิบที่ต้องใช้ (กก.)",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ))
                          ],
                        ),
                      ),
                      buildRawItems(
                          context, "ปลาป่น", fishAmount.toStringAsFixed(2)),
                      buildRawItems(context, "กากถั่วเหลือง",
                          soybeanAmount.toStringAsFixed(2)),
                      buildRawItems(context, "เศษไก่ป่น",
                          chickenAmount.toStringAsFixed(2)),
                      buildRawItems(context, "ปลายข้าว",
                          brokenriceAmount.toStringAsFixed(2)),
                      buildRawItems(
                          context, "รำข้าว", riceAmount.toStringAsFixed(2)),
                      buildRawItems(
                          context, "มันบด", potatoAmount.toStringAsFixed(2)),
                      buildRawItems(
                          context, "กากปาล์ม", palmAmount.toStringAsFixed(2)),
                      buildRawItems(
                          context, "ข้าวโพดบด", cornAmount.toStringAsFixed(2)),
                      buildRawItems(context, "วิตามิน แร่ธาตุรวม",
                          vitaminAmount.toStringAsFixed(2)),
                      buildRawItems(
                          context, "น้ำมันพืช", oilAmount.toStringAsFixed(2)),
                      buildRawItems(context, "DL Methionine",
                          methionineAmount.toStringAsFixed(2)),
                      buildRawItems(context, "P18 / P21",
                          p18p21Amount.toStringAsFixed(2)),
                      const Divider(),
                      buildRawItems(
                          context, "รวม กก.", sum.toStringAsFixed(0), true),
                    ],
                  ),
                )
              : Container(),
        ],
      )),
    );
  }

  Row buildRawItems(BuildContext context, String str, String amount,
      [bool isTotal = false]) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: isTotal
                ? Text(
                    str,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                : Text(str),
          ),
        ),
        Expanded(
            child: isTotal
                ? Text(amount,
                    style: const TextStyle(fontWeight: FontWeight.bold))
                : Text(amount))
      ],
    );
  }

  Widget createInputFeed() {
    return Column(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("กรุณาใส่ตัวเลขปริมาณอาหารที่จะผลิต (กก.)"),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width * 0.35,
              height: 50,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                ),
                controller: feedController,
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (feedController.text.isNotEmpty) {
                    calculateFeed();
                  } else {
                    setState(() {
                      _isCalucalted = false;
                    });
                  }
                },
                child: const Text("คำนวณ"))
          ],
        ),
      ],
    );
  }

  calculateFeed() {
    double feed = double.parse(feedController.text);
    print(feed);
    setState(() {
      fishAmount = ((widget.fish * 10) * feed) / 1000;
      soybeanAmount = ((widget.soybean * 10) * feed) / 1000;
      chickenAmount = ((widget.chicken * 10) * feed) / 1000;
      brokenriceAmount = ((widget.brokenrice * 10) * feed) / 1000;
      riceAmount = ((widget.rice * 10) * feed) / 1000;
      potatoAmount = ((widget.potato * 10) * feed) / 1000;
      palmAmount = ((widget.palm * 10) * feed) / 1000;
      cornAmount = ((widget.corn * 10) * feed) / 1000;
      vitaminAmount = ((widget.vitamin * 10) * feed) / 1000;
      oilAmount = ((widget.oil * 10) * feed) / 1000;
      methionineAmount = ((widget.methionine * 10) * feed) / 1000;
      p18p21Amount = ((widget.p18p21 * 10) * feed) / 1000;

      sum = fishAmount +
          soybeanAmount +
          chickenAmount +
          brokenriceAmount +
          riceAmount +
          potatoAmount +
          palmAmount +
          cornAmount +
          vitaminAmount +
          oilAmount +
          methionineAmount +
          p18p21Amount;

      _isCalucalted = true;
    });
    print(sum);
  }
}
