import 'package:flutter/material.dart';


/// Custom clipper for creating a path with curved edges.
class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from the top-left corner
    path.moveTo(0, 20);

    // Top-left corner curve
    const topLeftControlPoint = Offset(0, 0);
    const topLeftEndPoint = Offset(20, 0);
    path.quadraticBezierTo(topLeftControlPoint.dx, topLeftControlPoint.dy, topLeftEndPoint.dx, topLeftEndPoint.dy);

    // Draw the top edge straight line after the left curve
    path.lineTo(size.width - 20, 0);

    // Top-right corner curve
    final topRightControlPoint = Offset(size.width, 0);
    final topRightEndPoint = Offset(size.width, 20);
    path.quadraticBezierTo(topRightControlPoint.dx, topRightControlPoint.dy, topRightEndPoint.dx, topRightEndPoint.dy);

    // Draw the right edge straight line
    path.lineTo(size.width, size.height);

    // Draw the bottom edge straight line
    path.lineTo(0, size.height);

    // Close the path to form the shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Always reclip to update the path when needed
    return true;
  }
}