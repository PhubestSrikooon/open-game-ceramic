import 'package:flutter/material.dart';
import 'package:open_game_ceramic/elements/elementStyle.dart';

class CustomNavbutton extends StatefulWidget {
  final IconData icons;
  final bool active;
  final void Function()? onPressed;
  const CustomNavbutton(
      {super.key, required this.icons, this.active = false, this.onPressed});
  @override
  State<CustomNavbutton> createState() => _CustomNavbuttonState();
}

class _CustomNavbuttonState extends State<CustomNavbutton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: widget.active
            ? customNavStyleActive(context)
            : customNavStyleInactive(context),
        child: Column(
          children: [
            Icon(widget.icons),
            Text(
              "Home",
              style: widget.active
                  ? customNavStyleActiveText(context)
                  : customNavStyleInactiveText(context),
            )
          ],
        ));
  }
}
