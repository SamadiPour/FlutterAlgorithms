import 'package:chart/pointer.dart';
import 'package:flutter/material.dart';

class Indicators with ChangeNotifier {
    int _firstIndex = 0;
    int _secondIndex = 0;
    CustomPainter _firstShape = LeftHalfPointer();
    CustomPainter _secondShape = RightHalfPointer();
    double initPosition = (0.0 - 17.5) - 35 * 4; //half of one + 4 other

    int get firstIndex => _firstIndex;

    int get secondIndex => _secondIndex;

    CustomPainter get firstShape => _firstShape;

    CustomPainter get secondShape => _secondShape;

    set firstIndex(int value) {
        _changeShape(value == secondIndex);
        _firstIndex = value;
        notifyListeners();
    }

    set secondIndex(int value) {
        _changeShape(value == firstIndex);
        _secondIndex = value;
        notifyListeners();
    }

    _changeShape(bool willBeEqual) {
        if (willBeEqual) { //in next move they will be equal
            if (firstIndex < secondIndex) {
                _firstShape = LeftHalfPointer();
                _secondShape = RightHalfPointer();
            } else if (firstIndex > secondIndex) {
                _firstShape = RightHalfPointer();
                _secondShape = LeftHalfPointer();
            }
        } else {
            _firstShape = NormalPointer();
            _secondShape = NormalPointer();
        }
    }

    //reset indicators to initial positions
    reset() {
        _firstIndex = 0;
        _secondIndex = 0;
        notifyListeners();
    }
}