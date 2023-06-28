import 'package:catfishfeedapp/models/headerapp.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowNutritionPage extends StatefulWidget {
  const ShowNutritionPage(
      this.protein, this.fat, this.waste, this.carb, this.cost,
      {super.key});

  final double protein, fat, waste, carb, cost;

  @override
  State<ShowNutritionPage> createState() => _ShowNutritionPageState();
}

class _ShowNutritionPageState extends State<ShowNutritionPage> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(
          'โปรตีน',
          double.parse(widget.protein.toStringAsFixed(1)),
          "${widget.protein.toStringAsFixed(1)}%",
          const Color.fromRGBO(9, 0, 136, 1)),
      ChartData(
          'ไขมัน',
          double.parse(widget.fat.toStringAsFixed(1)),
          "${widget.fat.toStringAsFixed(1)}%",
          const Color.fromRGBO(147, 0, 119, 1)),
      ChartData(
          'กาก',
          double.parse(widget.waste.toStringAsFixed(1)),
          "${widget.waste.toStringAsFixed(1)}%",
          const Color.fromRGBO(228, 0, 124, 1)),
      ChartData(
          'คาร์โบไฮเดรต',
          double.parse(widget.carb.toStringAsFixed(1)),
          "${widget.carb.toStringAsFixed(1)}%",
          const Color.fromRGBO(255, 189, 57, 1))
    ];
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        children: [
          createHeaderLogo(),
          appName(),
          Container(
            child: SfCircularChart(
                legend: const Legend(
                    isVisible: true,
                    // Border color and border width of legend
                    borderColor: Colors.black,
                    borderWidth: 2),
                series: <CircularSeries>[
                  // Renders doughnut chart
                  DoughnutSeries<ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    dataLabelMapper: (ChartData data, _) => data.text,
                    dataLabelSettings: const DataLabelSettings(
                        // Renders the data label

                        isVisible: true),
                  ),
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 80,
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Center(
                  child: Text(
                "ต้นทุน: ${widget.cost} บาท/กก.",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      )),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text, [this.color]);
  final String x;
  final double y;
  final String text;
  final Color? color;
}
