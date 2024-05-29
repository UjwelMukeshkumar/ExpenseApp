import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mychart extends StatefulWidget {
  const Mychart({super.key});

  @override
  State<Mychart> createState() => _MychartState();
}

class _MychartState extends State<Mychart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        toY: y,
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.tertiary
        ], transform: GradientRotation(pi / 40)),
        width: 10,
        backDrawRodData: BackgroundBarChartRodData(
            show: true, toY: 5, color: Colors.grey.shade300),
      )
    ]);
  }

  List<BarChartGroupData> showingroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 4.5);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.5);
          case 6:
            return makeGroupData(6, 4);
          case 7:
            return makeGroupData(7, 3.8);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
        titlesData: FlTitlesData(
          show: true,
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 38,
                  getTitlesWidget: getTiles)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true, reservedSize: 38, getTitlesWidget: leftTiles),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        barGroups: showingroups());
  }

  Widget getTiles(double value, TitleMeta meta) {
    Style:
    TextStyle(
        fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey[700]);
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text('01',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]));
        break;
      case 1:
        text = Text('02',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]));
        break;
      case 2:
        text = Text('03',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]));
        break;
      case 3:
        text = Text('04',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]));
        break;
      case 4:
        text = Text('05',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]));
        break;
      case 5:
        text = Text('06',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]));
        break;
      case 6:
        text = Text('07',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]));
        break;
      default:
        text = Text('08',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]));
    }
    return SideTitleWidget(axisSide: meta.axisSide, space: 16, child: text);
  }

  Widget leftTiles(double value, TitleMeta meta) {
    style:
    TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700]);

    String text;
    if (value == 0) {
      text = '\₹ 1k';
    } else if (value == 2) {
      text = '\₹ 2k';
    } else if (value == 3) {
      text = '\₹ 3k';
    } else if (value == 4) {
      text = '\₹ 4k';
    } else if (value == 5) {
      text = '\₹ 5k';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700])),
    );
  }
}
