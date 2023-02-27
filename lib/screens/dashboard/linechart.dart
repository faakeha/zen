import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/flchartpage_provider.dart';

import '../../models/assessment_json.dart';
import '../../repositories/assessment_repo.dart';

class FlChartPage extends StatefulWidget {
  const FlChartPage({Key? key}) : super(key: key);

  @override
  State<FlChartPage> createState() => _FlChartPageState();
}

class _FlChartPageState extends State<FlChartPage> {
  @override
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
      await context.read<FlChartPageProvider>().getUser(),
      await context.read<FlChartPageProvider>().scoreTotal()
    });
  }


  Widget build(BuildContext context) {
    List<double> symptoms_total = context.watch<FlChartPageProvider>().scoreTotals;
    List<FlSpot> spots = symptoms_total.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();

    //List<FlSpot> spots = [FlSpot(0, 1), FlSpot(4, 10)];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: 200,
        height: 200,
        child: LineChart(LineChartData(
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.shade200, width: 2)),
            gridData: FlGridData(
              show: true,
              horizontalInterval: 2,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey.shade200, strokeWidth: 1);
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(color: Colors.grey.shade200, strokeWidth: 1);
              },
            ),
            titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xff68737d),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            );
                          case 2:
                            return const Text(
                              '2',
                              style: TextStyle(
                                color: Color(0xff68737d),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            );
                          case 4:
                            return const Text(
                              '4',
                              style: TextStyle(
                                color: Color(0xff68737d),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            );
                          case 6:
                            return const Text(
                              '6',
                              style: TextStyle(
                                color: Color(0xff68737d),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            );
                          case 8:
                            return const Text(
                              '8',
                              style: TextStyle(
                                color: Color(0xff68737d),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            );
                        }
                        return const Text(" ");
                      }),
                ),
                rightTitles:  AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles:  AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 20,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text(
                                '0',
                                style: TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              );
                            case 2:
                              return const Text(
                                '2',
                                style: TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              );
                            case 4:
                              return const Text(
                                '4',
                                style: TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              );
                            case 6:
                              return const Text(
                                '6',
                                style: TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              );
                            case 8:
                              return const Text(
                                '8',
                                style: TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              );
                          }
                          return const Text(" ");
                        }))),
            maxX: 8,
            maxY: 50,
            minX: 0,
            minY: 0,
            lineBarsData: [
              LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: Colors.black12,
                  barWidth: 5,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff23b6e6),
                        Color(0xff02d39a),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ))
            ])),
      ),
    );
  }
}
