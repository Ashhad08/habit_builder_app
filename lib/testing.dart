import 'package:flutter/material.dart';
import 'package:habit_builder_app/configurations/front_end.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: MyCustomClipper(percentage: 0.5),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FrontEndConfigs.kHabitColor,
              borderRadius: BorderRadius.circular(16)
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final double percentage;

  MyCustomClipper({required this.percentage});

  @override
  Path getClip(Size size) {
    if (percentage >= 0 && percentage <= 1) {
      if (percentage == 0.5) {
        Path path = Path()
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height)
          ..close();
        return path;
      } else {
        Path path = Path();
        path.moveTo(0, size.height - size.height * percentage);
        path.lineTo(0, size.height);
        path.lineTo(size.width - size.width * percentage, size.height);
        path.close();
        return path;
      }
    } else {
      Path path = Path();
      return path;
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}