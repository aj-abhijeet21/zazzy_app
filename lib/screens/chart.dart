import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zazzy_app/models/weather.dart';
import 'package:zazzy_app/services/utils.dart';
import 'package:intl/intl.dart';

class ChartPage extends StatefulWidget {
  List<WeatherModel> weatherData;
  ChartPage({required this.weatherData});

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final SelectionBehavior _selectionBehavior = SelectionBehavior(
    enable: true,
    selectedColor: darkOrange,
    unselectedColor: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    // String day = 'Today';
    // double temp = 0;
    return Stack(
      children: [
        SfCartesianChart(
          plotAreaBackgroundColor: lightOrange.withOpacity(0.05),

          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            isVisible: false,
            title: AxisTitle(text: 'Temperature in °C'),
            labelAlignment: LabelAlignment.center,
            // labelRotation: -90,
            minimum: 0,
            maximum: 50,
            interval: 10,
          ),
          // title: ChartTitle(text: 'Last 7 days temperature'),
          tooltipBehavior: TooltipBehavior(enable: true),
          backgroundColor: Colors.white,
          series: <ChartSeries<WeatherModel, String>>[
            ColumnSeries<WeatherModel, String>(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              name: 'Temperature',
              // spacing: 1,
              gradient: LinearGradient(
                colors: [lightOrange, darkOrange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              width: 0.8,
              selectionBehavior: _selectionBehavior,
              dataSource: widget.weatherData,
              xValueMapper: (WeatherModel weather, _) =>
                  DateFormat('EEEE').format(weather.date).substring(0, 3),
              yValueMapper: (WeatherModel weather, _) => weather.temperature,
              color: darkOrange,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(
                  color: darkOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // onPointTap: (ChartPointDetails value) {
              //   double newTemp =
              //       widget.weatherData[value.pointIndex!].temperature;
              //   setState(() {
              //     temp = newTemp;
              //   });
              // },
            ),
          ],
        ),
        Positioned(
          top: 50,
          left: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Temperature of last 7 days',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                'in °C',
                style: TextStyle(
                    color: darkOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
