import 'package:emf_calculator/models/magnitudeProder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Visualize extends StatelessWidget {
  const Visualize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<LiveData> chartModel;
    late ChartSeriesController chartSeriesController;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('Visuals'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Card(
                color: Colors.grey.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Consumer<MagnitudeProvider>(
                    builder: (context, model, child) {
                  return SfCartesianChart(
                    title: ChartTitle(text: 'x,y,z with Time'),
                    legend: Legend(
                        isVisible: true, title: LegendTitle(text: 'Legend')),
                    series: <LineSeries<LiveData, int>>[
                      LineSeries<LiveData, int>(
                          legendItemText: 'x',
                          onRendererCreated:
                              (ChartSeriesController controller) {
                            chartSeriesController = controller;
                          },
                          dataSource: model.values,
                          color: Colors.red,
                          xValueMapper: (LiveData value, _) => value.time,
                          yValueMapper: (LiveData value, _) => value.x),
                      LineSeries<LiveData, int>(
                          legendItemText: 'y',
                          onRendererCreated:
                              (ChartSeriesController controller) {
                            chartSeriesController = controller;
                          },
                          dataSource: model.values,
                          color: Colors.blue,
                          xValueMapper: (LiveData value, _) => value.time,
                          yValueMapper: (LiveData value, _) => value.y),
                      LineSeries<LiveData, int>(
                          legendItemText: 'z',
                          onRendererCreated:
                              (ChartSeriesController controller) {
                            chartSeriesController = controller;
                          },
                          dataSource: model.values,
                          color: Colors.green,
                          xValueMapper: (LiveData value, _) => value.time,
                          yValueMapper: (LiveData value, _) => value.z),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// class LiveData {
//   LiveData({required this.color, required this.xData, required this.yData});
//   final int xData;
//   final int yData;
//   final Color color;
// }
