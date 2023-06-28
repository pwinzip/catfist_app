import 'package:catfishfeedapp/models/headerapp.dart';
import 'package:catfishfeedapp/pages/feed.dart';
import 'package:catfishfeedapp/pages/shownutrition.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fishPercentController = TextEditingController();
  final TextEditingController fishPriceController = TextEditingController();
  final TextEditingController soybeanPercentController =
      TextEditingController();
  final TextEditingController soybeanPriceController = TextEditingController();
  final TextEditingController chickenPercentController =
      TextEditingController();
  final TextEditingController chickenPriceController = TextEditingController();
  final TextEditingController brokenricePercentController =
      TextEditingController();
  final TextEditingController brokenricePriceController =
      TextEditingController();
  final TextEditingController ricePercentController = TextEditingController();
  final TextEditingController ricePriceController = TextEditingController();
  final TextEditingController potatoPercentController = TextEditingController();
  final TextEditingController potatoPriceController = TextEditingController();
  final TextEditingController palmPercentController = TextEditingController();
  final TextEditingController palmPriceController = TextEditingController();
  final TextEditingController cornPercentController = TextEditingController();
  final TextEditingController cornPriceController = TextEditingController();
  final TextEditingController vitaminPercentController =
      TextEditingController();
  final TextEditingController vitaminPriceController = TextEditingController();
  final TextEditingController oilPercentController = TextEditingController();
  final TextEditingController oilPriceController = TextEditingController();
  final TextEditingController methioninePercentController =
      TextEditingController();
  final TextEditingController methioninePriceController =
      TextEditingController();
  final TextEditingController p18p21PercentController = TextEditingController();
  final TextEditingController p18p21PriceController = TextEditingController();

  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        const Text("รวม (%)  "),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(total.toStringAsFixed(1)),
        )
      ]),
      body: SafeArea(
        child: ListView(
          children: [
            createHeaderLogo(),
            appName(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Text(
                              "% ที่ต้องการใส่ในอาหาร",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Text(
                              "ราคาวัตถุดิบ (บาท/กก.)",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildCardMaterial(context, "ปลาป่น", fishPercentController,
                      fishPriceController, "5-20"),
                  buildCardMaterial(
                      context,
                      "กากถั่วเหลือง",
                      soybeanPercentController,
                      soybeanPriceController,
                      "15-40"),
                  buildCardMaterial(
                      context,
                      "เศษไก่ป่น",
                      chickenPercentController,
                      chickenPriceController,
                      "15-35"),
                  buildCardMaterial(
                      context,
                      "ปลายข้าว",
                      brokenricePercentController,
                      brokenricePriceController,
                      "5-20"),
                  buildCardMaterial(context, "รำข้าว", ricePercentController,
                      ricePriceController, "10-30"),
                  buildCardMaterial(context, "มันบด", potatoPercentController,
                      potatoPriceController, "10-30"),
                  buildCardMaterial(context, "กากปาล์ม", palmPercentController,
                      palmPriceController, "10-15"),
                  buildCardMaterial(context, "ข้าวโพดบด", cornPercentController,
                      cornPriceController, "10-30"),
                  buildCardMaterial(
                      context,
                      "วิตามิน แร่ธาตุรวม",
                      vitaminPercentController,
                      vitaminPriceController,
                      "0.5-1"),
                  buildCardMaterial(context, "น้ำมันพืช", oilPercentController,
                      oilPriceController, "1-3"),
                  buildCardMaterial(
                      context,
                      "DL Methionine",
                      methioninePercentController,
                      methioninePriceController,
                      "0.1-0.3"),
                  buildCardMaterial(
                      context,
                      "P18 / P21",
                      p18p21PercentController,
                      p18p21PriceController,
                      "0.3-0.5"),
                  Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: const Text("รวม",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                                textAlign: TextAlign.end),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              total.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  createCalNutritionBtn(context),
                  createCalFeedBtn(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createCalFeedBtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              double fishPercent = fishPercentController.text.isEmpty
                  ? 0
                  : double.parse(fishPercentController.text);
              double soybeanPercent = soybeanPercentController.text.isEmpty
                  ? 0
                  : double.parse(soybeanPercentController.text);
              double chickenPercent = chickenPercentController.text.isEmpty
                  ? 0
                  : double.parse(chickenPercentController.text);
              double brokenricePercent =
                  brokenricePercentController.text.isEmpty
                      ? 0
                      : double.parse(brokenricePercentController.text);
              double ricePercent = ricePercentController.text.isEmpty
                  ? 0
                  : double.parse(ricePercentController.text);
              double potatoPercent = potatoPercentController.text.isEmpty
                  ? 0
                  : double.parse(potatoPercentController.text);
              double palmPercent = palmPercentController.text.isEmpty
                  ? 0
                  : double.parse(palmPercentController.text);
              double cornPercent = cornPercentController.text.isEmpty
                  ? 0
                  : double.parse(cornPercentController.text);
              double vitaminPercent = vitaminPercentController.text.isEmpty
                  ? 0
                  : double.parse(vitaminPercentController.text);
              double oilPercent = oilPercentController.text.isEmpty
                  ? 0
                  : double.parse(oilPercentController.text);
              double methioninePercent =
                  methioninePercentController.text.isEmpty
                      ? 0
                      : double.parse(methioninePercentController.text);
              double p18p21Percent = p18p21PercentController.text.isEmpty
                  ? 0
                  : double.parse(p18p21PercentController.text);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedPage(
                        fish: fishPercent,
                        soybean: soybeanPercent,
                        chicken: chickenPercent,
                        brokenrice: brokenricePercent,
                        rice: ricePercent,
                        potato: potatoPercent,
                        palm: palmPercent,
                        corn: cornPercent,
                        vitamin: vitaminPercent,
                        oil: oilPercent,
                        methionine: methioninePercent,
                        p18p21: p18p21Percent),
                  ));
            } else {
              Fluttertoast.showToast(
                  msg: "กรุณาใส่ % ที่ต้องการใส่ในอาหารให้เท่ากับ 100 %",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: const Text(
            "คำนวณปริมาณอาหารที่จะผลิต",
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget createCalNutritionBtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (total == 100) {
                // calculate protien
                double fat, protein, waste, carb, cost;
                double fishPercent = fishPercentController.text.isEmpty
                    ? 0
                    : double.parse(fishPercentController.text);
                double soybeanPercent = soybeanPercentController.text.isEmpty
                    ? 0
                    : double.parse(soybeanPercentController.text);
                double chickenPercent = chickenPercentController.text.isEmpty
                    ? 0
                    : double.parse(chickenPercentController.text);
                double brokenricePercent =
                    brokenricePercentController.text.isEmpty
                        ? 0
                        : double.parse(brokenricePercentController.text);
                double ricePercent = ricePercentController.text.isEmpty
                    ? 0
                    : double.parse(ricePercentController.text);
                double potatoPercent = potatoPercentController.text.isEmpty
                    ? 0
                    : double.parse(potatoPercentController.text);
                double palmPercent = palmPercentController.text.isEmpty
                    ? 0
                    : double.parse(palmPercentController.text);
                double cornPercent = cornPercentController.text.isEmpty
                    ? 0
                    : double.parse(cornPercentController.text);
                double vitaminPercent = vitaminPercentController.text.isEmpty
                    ? 0
                    : double.parse(vitaminPercentController.text);
                double oilPercent = oilPercentController.text.isEmpty
                    ? 0
                    : double.parse(oilPercentController.text);
                double methioninePercent =
                    methioninePercentController.text.isEmpty
                        ? 0
                        : double.parse(methioninePercentController.text);
                double p18p21Percent = p18p21PercentController.text.isEmpty
                    ? 0
                    : double.parse(p18p21PercentController.text);
                double fishPrice = double.parse(fishPriceController.text);
                double soybeanPrice = double.parse(soybeanPriceController.text);
                double chickenPrice = double.parse(chickenPriceController.text);
                double brokenricePrice =
                    double.parse(brokenricePriceController.text);
                double ricePrice = double.parse(ricePriceController.text);
                double potatoPrice = double.parse(potatoPriceController.text);
                double palmPrice = double.parse(palmPriceController.text);
                double cornPrice = double.parse(cornPriceController.text);
                double vitaminPrice = double.parse(vitaminPriceController.text);
                double oilPrice = double.parse(oilPriceController.text);
                double methioninePrice =
                    double.parse(methioninePriceController.text);
                double p18p21Price = double.parse(p18p21PriceController.text);

                fat = (0.25 * fishPercent) +
                    (0.07 * soybeanPercent) +
                    (0.17 * chickenPercent) +
                    (0.03 * brokenricePercent) +
                    (0.25 * ricePercent) +
                    (0.002 * potatoPercent) +
                    (0.05 * palmPercent) +
                    (0.003 * cornPercent) +
                    oilPercent;
                protein = (0.53 * fishPercent) +
                    (0.42 * soybeanPercent) +
                    (0.58 * chickenPercent) +
                    (0.07 * brokenricePercent) +
                    (0.12 * ricePercent) +
                    (0.03 * potatoPercent) +
                    (0.12 * palmPercent) +
                    (0.006 * cornPercent);
                waste = (0.19 * fishPercent) +
                    (0.05 * soybeanPercent) +
                    (0.13 * chickenPercent) +
                    (0.007 * brokenricePercent) +
                    (0.24 * ricePercent) +
                    (0.007 * potatoPercent) +
                    (0.12 * palmPercent) +
                    (0.09 * cornPercent);
                carb = 100 - (fat + protein + waste);
                cost = ((fishPercent * 10) * (fishPrice / 1000)) +
                    ((soybeanPercent * 10) * (soybeanPrice / 1000)) +
                    ((chickenPercent * 10) * (chickenPrice / 1000)) +
                    ((brokenricePercent * 10) * (brokenricePrice / 1000)) +
                    ((ricePercent * 10) * (ricePrice / 1000)) +
                    ((potatoPercent * 10) * (potatoPrice / 1000)) +
                    ((palmPercent * 10) * (palmPrice / 1000)) +
                    ((cornPercent * 10) * (cornPrice / 1000)) +
                    ((vitaminPercent * 10) * (vitaminPrice / 1000)) +
                    ((oilPercent * 10) * (oilPrice / 1000)) +
                    ((methioninePercent * 10) * (methioninePrice / 1000)) +
                    ((p18p21Percent * 10) * (p18p21Price / 1000));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ShowNutritionPage(protein, fat, waste, carb, cost),
                    ));
              } else {
                Fluttertoast.showToast(
                    msg: "กรุณาใส่ % ที่ต้องการใส่ในอาหารให้เท่ากับ 100 %",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          },
          child: const Text(
            "คำนวณคุณค่าทางอาหาร",
            textAlign: TextAlign.center,
          )),
    );
  }

  Card buildCardMaterial(
      BuildContext context,
      String str,
      TextEditingController percentController,
      TextEditingController priceController,
      String sugestion) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Column(
                children: [
                  Text(str),
                  Text(
                    "ปริมาณที่แนะนำ\n$sugestion (%)",
                    style: const TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextFormField(
                onChanged: (value) => calculateTotal(),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
                controller: percentController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "ใส่ราคา";
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
                controller: priceController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  calculateTotal() {
    double fishPercent = fishPercentController.text.isEmpty
        ? 0
        : double.parse(fishPercentController.text);
    double soybeanPercent = soybeanPercentController.text.isEmpty
        ? 0
        : double.parse(soybeanPercentController.text);
    double chickenPercent = chickenPercentController.text.isEmpty
        ? 0
        : double.parse(chickenPercentController.text);
    double brokenricePercent = brokenricePercentController.text.isEmpty
        ? 0
        : double.parse(brokenricePercentController.text);
    double ricePercent = ricePercentController.text.isEmpty
        ? 0
        : double.parse(ricePercentController.text);
    double potatoPercent = potatoPercentController.text.isEmpty
        ? 0
        : double.parse(potatoPercentController.text);
    double palmPercent = palmPercentController.text.isEmpty
        ? 0
        : double.parse(palmPercentController.text);
    double cornPercent = cornPercentController.text.isEmpty
        ? 0
        : double.parse(cornPercentController.text);
    double vitaminPercent = vitaminPercentController.text.isEmpty
        ? 0
        : double.parse(vitaminPercentController.text);
    double oilPercent = oilPercentController.text.isEmpty
        ? 0
        : double.parse(oilPercentController.text);
    double methioninePercent = methioninePercentController.text.isEmpty
        ? 0
        : double.parse(methioninePercentController.text);
    double p18p21Percent = p18p21PercentController.text.isEmpty
        ? 0
        : double.parse(p18p21PercentController.text);
    setState(() {
      total = fishPercent +
          soybeanPercent +
          chickenPercent +
          brokenricePercent +
          ricePercent +
          potatoPercent +
          palmPercent +
          cornPercent +
          vitaminPercent +
          oilPercent +
          methioninePercent +
          p18p21Percent;
    });
    print(total.toString());
  }
}
