import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesBarChart extends StatelessWidget {
  final Map<String, double> salesData;

  const SalesBarChart({super.key, required this.salesData});

  @override
  Widget build(BuildContext context) {
    if (salesData.isEmpty) {
      return const Center(
        child: Text(
          'No hay datos para mostrar',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    final maxY = salesData.values.reduce((a, b) => a > b ? a : b) * 1.2;
    final barGroups =
        salesData.entries.map((entry) {
          return BarChartGroupData(
            x: salesData.keys.toList().indexOf(entry.key),
            barRods: [
              BarChartRodData(
                toY: entry.value,
                color: Colors.green,
                width: 18,
                borderRadius: BorderRadius.circular(6),
              ),
            ],
          );
        }).toList();

    final months = salesData.keys.toList();

    return BarChart(
      BarChartData(
        maxY: maxY,
        barGroups: barGroups,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 1,
              getTitlesWidget: (value, meta) {
                if (value.toInt() < 0 || value.toInt() >= months.length) {
                  return const SizedBox();
                }
                return SideTitleWidget(
                  meta: meta,
                  child: Transform.rotate(
                    angle: -0.5,
                    child: Text(
                      months[value.toInt()],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: maxY / 5,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  meta: meta,
                  child: Text(
                    value.toInt().toString(),
                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                );
              },
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
