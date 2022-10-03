import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 46,
      child: FloatingActionButton(
          onPressed: onPressed,
          elevation: 0,
          backgroundColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.1),
          child: Icon(
            icon,
            color: FrontEndConfigs.kSecondaryColor,
          )),
    );
  }
}
