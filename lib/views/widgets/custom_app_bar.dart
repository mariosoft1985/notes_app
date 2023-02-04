import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.icon,
      this.iconOnPressed,
      this.iconButtonIcon,
      this.iconButtonOnPressed})
      : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? iconOnPressed;
  final IconData? iconButtonIcon;
  final void Function()? iconButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        IconButton(
          onPressed: iconButtonOnPressed,
          icon: Icon(iconButtonIcon),
        ),
        IconButton(
          onPressed: iconOnPressed,
          icon: Icon(icon),
        ),
      ],
    );
  }
}
