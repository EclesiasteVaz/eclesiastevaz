import 'package:flutter/material.dart';

class IdentifierDevice {
  static bool isComputer(BuildContext context) =>
    MediaQuery.sizeOf(context).width > 600;

}