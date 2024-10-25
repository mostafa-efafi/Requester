// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TabBarOutlineIndicator extends Decoration {
  const TabBarOutlineIndicator({
    this.radius = const Radius.circular(7),
    this.color = Colors.teal,
    this.strokeWidth = 0,
  });
  final Color color;
  final double strokeWidth;
  final Radius radius;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _OutlinePainter(
      strokeWidth: strokeWidth,
      radius: radius,
      onChange: onChanged,
      color: color,
    );
  }
}

class _OutlinePainter extends BoxPainter {
  _OutlinePainter({
    required this.radius,
    required this.strokeWidth,
    required this.color,
    VoidCallback? onChange,
  })  : _paint = Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill,
        super(onChange);
  final Color color;
  final Radius radius;
  final double strokeWidth;
  final Paint _paint;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final rect = offset & configuration.size!;
    final rrect = RRect.fromRectAndRadius(rect, radius);
    canvas.drawRRect(rrect, _paint);
  }
}
