import 'package:flutter/material.dart';

class NormalPointer extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        var paint = Paint();
        paint.style = PaintingStyle.fill;

        var path = Path();

        final topPartSize = 5.0;
        final topSpace = 0.1;

        path.moveTo(size.width * (0.5 - topSpace), 0);
        path.lineTo(0, topPartSize);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, topPartSize);
        path.lineTo(size.width * (0.5 + topSpace), 0);

        canvas.drawPath(path, paint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
        return true;
    }
}

class LeftHalfPointer extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        var paint = Paint();
        paint.style = PaintingStyle.fill;

        var path = Path();

        final topPartSize = 5.0;
        final topSpace = 0.1;

        path.moveTo(size.width * (0.5 - (topSpace * 0.5)), 0);
        path.lineTo(size.width * (0.5 - topSpace), 0);
        path.lineTo(0, topPartSize);
        path.lineTo(0, size.height);
        path.lineTo(size.width * (0.5 - (topSpace * 0.5)), size.height);

        canvas.drawPath(path, paint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
        return true;
    }
}

class RightHalfPointer extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        var paint = Paint();
        paint.style = PaintingStyle.fill;

        var path = Path();

        final topPartSize = 5.0;
        final topSpace = 0.1;

        path.moveTo(size.width * (0.5 + (topSpace * 0.5)), 0);
        path.lineTo(size.width * (0.5 + topSpace), 0);
        path.lineTo(size.width, topPartSize);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width * (0.5 + (topSpace * 0.5)), size.height);
//        path.lineTo(size.width * (0.5 - topSpace), 0);

        canvas.drawPath(path, paint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
        return true;
    }
}
