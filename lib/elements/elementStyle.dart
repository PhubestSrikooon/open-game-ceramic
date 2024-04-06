import 'package:flutter/material.dart';

ButtonStyle customNavStyleInactive(BuildContext context) => ButtonStyle(
    padding:
        MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(16)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)))));

ButtonStyle customNavStyleActive(BuildContext context) => ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
    iconColor: MaterialStateProperty.all<Color>(
        Theme.of(context).colorScheme.background),
    padding:
        MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(16)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)))));

TextStyle customNavStyleActiveText(BuildContext context) =>
    TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.background);

TextStyle customNavStyleInactiveText(BuildContext context) =>
    TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary);
