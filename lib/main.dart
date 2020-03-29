import 'package:chart/ChartList.dart';
import 'package:chart/Indicators.dart';
import 'package:chart/InsertionSort.dart';
import 'package:chart/pointer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: <SingleChildWidget>[
                ChangeNotifierProvider(create: (_) => ChartList()),
                ChangeNotifierProvider(create: (_) => Indicators()),
            ],
            child: MaterialApp(
                title: 'Charts',
                showPerformanceOverlay: false,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    brightness: Brightness.dark,
                ),
                home: MyHomePage(),
            ),
        );
    }
}

class MyHomePage extends StatefulWidget {
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    InsertionSort insertionSort;

    @override
    void initState() {
        super.initState();
        insertionSort = InsertionSort(
            Provider.of<ChartList>(context, listen: false),
            Provider.of<Indicators>(context, listen: false),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () {
                    insertionSort.sort();
                },
            ),
            appBar: AppBar(
                title: Text('Insertion Sort'),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.shuffle),
                        onPressed: () {
                            Provider.of<ChartList>(context, listen: false).randomize();
                        },
                    ),
                    IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                            Provider.of<ChartList>(context, listen: false).reset();
                            Provider.of<Indicators>(context, listen: false).reset();
                        },
                    ),
                ],
            ),
            body: SafeArea(
                child: Center(
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                    Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: Provider
                                                        .of<ChartList>(context)
                                                        .chartsWidget,
                                            ),
                                        ),
                                    ),
                                    _indicatorsWidget(),
                                ],
                            ),
                        ),
                    ),
                ),
            ),
        );
    }

    Widget _indicatorsWidget() {
        return Consumer<Indicators>(
            builder: (BuildContext context, Indicators value, Widget child) {
                return Stack(
                    children: <Widget>[
                        AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: value.firstIndex == value.secondIndex ? 20 : 15,
                            height: 20,
                            transform: Matrix4.translationValues(
                                value.initPosition + value.firstIndex * 35,
                                0,
                                0,
                            ),
                            child: CustomPaint(
                                painter: value.firstShape,
                            ),
                        ),
                        AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: value.firstIndex == value.secondIndex ? 20 : 15,
                            height: 20,
                            transform: Matrix4.translationValues(
                                value.initPosition + value.secondIndex * 35,
                                0,
                                0,
                            ),
                            child: CustomPaint(
                                painter: value.secondShape,
                            ),
                        ),
                    ],
                );
            },
        );
    }
}
