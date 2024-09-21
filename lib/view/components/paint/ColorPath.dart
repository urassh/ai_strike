import 'dart:ui';

class ColorPath {
  final Path path = Path();
  final Color color;
  ColorPath(this.color);

  static List<ColorPath> paths = [];

  void setFirstPoint(Offset point) {
    path.moveTo(point.dx, point.dy);
  }

  void updatePath(Offset point) {
    path.lineTo(point.dx, point.dy);
  }
}