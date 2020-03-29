import 'package:chart/bar_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartList with ChangeNotifier {
    bool played = false;
    static List<Color> colors = const [
        Colors.green,
        Colors.orange,
        Colors.yellow,
        Colors.red,
        Colors.blueAccent,
        Colors.lightGreen,
        Colors.teal,
        Colors.cyanAccent,
        Colors.purpleAccent,
        Colors.pink,
        Colors.indigo,
    ];

    List<BarChart> _charts = [
        BarChart(10, color: colors[0],),
        BarChart(9, color: colors[1],),
        BarChart(8, color: colors[2],),
        BarChart(7, color: colors[3],),
        BarChart(6, color: colors[4],),
        BarChart(5, color: colors[5],),
        BarChart(4, color: colors[6],),
        BarChart(3, color: colors[7],),
        BarChart(2, color: colors[8],),
        BarChart(1, color: colors[9],),
    ];

    List<BarChart> get chartsWidget => _charts;

    //when algorithm want to change 2 charts positions
    swapIndex(int firstIndex, int secondIndex) {
        if (_charts.length < 2 || _charts.length - 1 < firstIndex || _charts.length - 1 < secondIndex)
            return;

        final temp = _charts[firstIndex];
        _charts[firstIndex] = _charts[secondIndex];
        _charts[secondIndex] = temp;
        notifyListeners();
    }

    //shuffle list to begin algorithm
    randomize() {
        if (played)
            reset();

        _charts.shuffle();
        notifyListeners();
    }

    //reset all widgets to initial positions and colors
    reset() {
        _charts = [
            BarChart(10, color: colors[0],),
            BarChart(9, color: colors[1],),
            BarChart(8, color: colors[2],),
            BarChart(7, color: colors[3],),
            BarChart(6, color: colors[4],),
            BarChart(5, color: colors[5],),
            BarChart(4, color: colors[6],),
            BarChart(3, color: colors[7],),
            BarChart(2, color: colors[8],),
            BarChart(1, color: colors[9],),
        ];
        played = false;
        notifyListeners();
    }
}