import 'package:flutter/material.dart';

class CSB extends ShapeBorder {
  final BorderRadius borderRadius = BorderRadius.circular(5);
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => EdgeInsetsGeometry.infinity;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    return new Path()
      ..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Path path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(100, 0.0);
    path.lineTo(100, 50 * 0.8);
    path.lineTo(0.0, 50);
    path.close();

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.black;

    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    return CSB();
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    // final Offset circleOffset =
    //     offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    // canvas.drawCircle(circleOffset, radius, _paint);

    canvas.drawRect(
      Rect.fromCenter(center: offset + Offset(60, 20), height: 40, width: 60),
      _paint,
    );
  }
}
