import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
    required this.iconPath,
    required this.onPressed,
  }) : super(key: key);
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: FrontEndConfigs.kPrimaryColor.withOpacity(0.5),
              offset: const Offset(0, 20),
              blurRadius: 40,
            )
          ],
          border: Border.all(
              width: 5, color: FrontEndConfigs.kPrimaryColor.withOpacity(0.2))),
      child: FloatingActionButton(
        onPressed: onPressed,
        elevation: 0,
        backgroundColor: FrontEndConfigs.kPrimaryColor,
        child: Image.asset(
          iconPath,
          height: 18,
          width: 18,
        ),
      ),
    );
  }
}
