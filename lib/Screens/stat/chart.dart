import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Mychart extends StatefulWidget {
  const Mychart({super.key});

  @override
  State<Mychart> createState() => _MychartState();
}

class _MychartState extends State<Mychart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BarChart(
        mainBarData(),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 12,
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 4),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => [
        makeGroupData(0, 2),
        makeGroupData(1, 3),
        makeGroupData(2, 2),
        makeGroupData(3, 4.5),
        makeGroupData(4, 3.8),
        makeGroupData(5, 1.5),
        makeGroupData(6, 4),
        makeGroupData(7, 3.8),
      ];

  BarChartData mainBarData() {
    return BarChartData(
      maxY: 5,
      alignment: BarChartAlignment.spaceAround,

      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.shade300,
            strokeWidth: 1,
          );
        },
      ),

      borderData: FlBorderData(show: false),

      titlesData: FlTitlesData(
        show: true,

        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: getTiles,
          ),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 55,
            interval: 1,
            getTitlesWidget: leftTiles,
          ),
        ),
      ),

      barGroups: showingGroups(),
    );
  }

  Widget getTiles(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      space: 8,
      child: Text(
        '${value.toInt() + 1}'.padLeft(2, '0'),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget leftTiles(double value, TitleMeta meta) {
    String? text;

    switch (value.toInt()) {
      case 1:
        text = '₹1k';
        break;
      case 2:
        text = '₹2k';
        break;
      case 3:
        text = '₹3k';
        break;
      case 4:
        text = '₹4k';
        break;
      case 5:
        text = '₹5k';
        break;
    }

    if (text == null) {
      return const SizedBox.shrink();
    }

    return SideTitleWidget(
      meta: meta,
      space: 8,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}