import 'package:eclesiastevaz/utils/identifier_device.dart';
import 'package:flutter/material.dart';

class BodyPageWidget extends StatelessWidget {
  final Widget? child;
  const BodyPageWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, __) =>  Padding(padding: _determineSpacing(context), child: child),
      itemCount: 1,
    );
  }

  EdgeInsets _determineSpacing(BuildContext context) {

    if (IdentifierDevice.isComputer(context)) {
      return EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * .15,
      );
    }
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.sizeOf(context).width * .01,
    );
  }
}
