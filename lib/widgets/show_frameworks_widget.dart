import 'package:eclesiastevaz/core/enums/technnologies.dart';
import 'package:eclesiastevaz/utils/identifier_device.dart';
import 'package:flutter/material.dart';

class ShowFrameworksWidget extends StatelessWidget {
  ShowFrameworksWidget({super.key});

  final List<Technnologies> _technnologies = <Technnologies>[
    Technnologies.flutter,
    Technnologies.laravel,
    Technnologies.mysql,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: IdentifierDevice.isComputer(context) ?  MediaQuery.sizeOf(context).width * .6 : MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
              _technnologies.map((technnology) {
                return SizedBox.square(
                  dimension: IdentifierDevice.isComputer(context) ? 90 : 60,
                  child: Image.asset(technnology.path),
                );
              }).toList(),
        ),
      ),
    );
  }
}
