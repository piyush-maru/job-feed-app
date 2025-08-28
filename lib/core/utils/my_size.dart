import 'package:flutter/widgets.dart';

class MySize {
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleFactorWidth;
  static late double scaleFactorHeight;
  static late double statusBarHeight;
  static late double bottomBarHeight;

  /// Call this in the first screen's build method or inside MaterialApp builder
  static void init(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;

    statusBarHeight = mediaQueryData.padding.top;
    bottomBarHeight = mediaQueryData.padding.bottom;

    // Base size from your design file (Figma, XD, etc.)
    scaleFactorWidth = screenWidth / 393; // Base design width
    scaleFactorHeight = screenHeight / 852; // Base design height
  }

  /// Width scaling
  static double w(double width) => width * scaleFactorWidth;

  /// Height scaling
  static double h(double height) => height * scaleFactorHeight;

  /// Font scaling with safe limits
  static double font(double size) {
    double scaled = size * ((scaleFactorWidth + scaleFactorHeight) / 2);
    return scaled.clamp(size * 0.85, size * 1.25);
  }

  /// Padding and margins
  static EdgeInsets padding(double left, double top, double right, double bottom) => EdgeInsets.fromLTRB(w(left), h(top), w(right), h(bottom));

  static EdgeInsets all(double value) => EdgeInsets.all(w(value));

  static EdgeInsets paddingLeft(double left) => EdgeInsets.only(left: w(left));

  static EdgeInsets paddingRight(double right) => EdgeInsets.only(right: w(right));

  static EdgeInsets paddingTop(double top) => EdgeInsets.only(top: h(top));

  static EdgeInsets paddingBottom(double bottom) => EdgeInsets.only(bottom: h(bottom));

  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) => EdgeInsets.symmetric(horizontal: w(horizontal), vertical: h(vertical));

  static EdgeInsets only({double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.only(left: w(left), top: h(top), right: w(right), bottom: h(bottom));
  }

  /// Border radius
  static BorderRadius radius(double all) => BorderRadius.all(Radius.circular(w(all)));

  static BorderRadius radiusOnly({double topLeft = 0, double topRight = 0, double bottomLeft = 0, double bottomRight = 0}) {
    return BorderRadius.only(topLeft: Radius.circular(w(topLeft)), topRight: Radius.circular(w(topRight)), bottomLeft: Radius.circular(w(bottomLeft)), bottomRight: Radius.circular(w(bottomRight)));
  }
}
