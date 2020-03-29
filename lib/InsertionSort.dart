import 'dart:math';

import 'package:chart/ChartList.dart';
import 'package:chart/Indicators.dart';

class InsertionSort {
    final ChartList chart;
    final Indicators indicators;

    InsertionSort(this.chart, this.indicators);

    sort() async {
        chart.played = true;
        final list = chart.chartsWidget;
        if (list == null || list.length == 0)
            return;

        for (var i = 1; i < list.length; i++) {
            //changing i
            indicators.secondIndex = i;
            await _wait();

            //changing j
            int j = i - 1;
            indicators.firstIndex = j;
            await _wait();

            int key = list[i].value;

            while (j >= 0 && key < list[j].value) {
                indicators.firstIndex = j;
                await _wait();

                indicators.secondIndex = j + 1;
                await _wait();

                chart.swapIndex(j, j + 1);
                await _wait();

                --j;
            }

            indicators.secondIndex = j + 1;
            indicators.firstIndex = j + 1;
            await _wait();
            await _wait();
        }
    }

    //just for testing purpose
    danceParty() async {
        indicators.firstIndex = Random().nextInt(10);
        indicators.secondIndex = Random().nextInt(10);
        chart.randomize();
        await Future.delayed(Duration(milliseconds: 500));
        danceParty();
    }

    _wait() async {
        await Future.delayed(Duration(milliseconds: 500));
    }
}