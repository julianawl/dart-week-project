import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/vakinha_ui.dart';

class IconBadge extends StatelessWidget {

  final int number;
  final IconData icon;

  const IconBadge({Key? key, required this.number, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 7,
              backgroundColor: Colors.red,
              child: Text(number.toString(),
              style: VakinhaUi.textBold.copyWith(
                fontSize: 7,
              ),),
            ),
          ),
        )
      ],
    );
  }
}
