import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
    final int value;
    final double space;
    Color color;

    BarChart(this.value, {
        this.color = Colors.white,
        this.space = 5.0,
        Key key,
    }) : super(key: key);

    @override
    _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
    @override
    Widget build(BuildContext context) {
        return AnimatedContainer(
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(3),
            ),
            margin: EdgeInsets.all(widget.space),
            duration: Duration(milliseconds: 300),
            height: widget.value * 25.0,
            width: 25,
            transform: Matrix4.translationValues(0, 0, 0),
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                    widget.value.toString(),
                    style: TextStyle(
                        color: Colors.black,
                    ),
                ),
            ),
        );
    }
}