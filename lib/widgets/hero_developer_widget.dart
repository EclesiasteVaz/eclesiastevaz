import 'package:eclesiastevaz/utils/identifier_device.dart';
import 'package:flutter/material.dart';

class HeroDeveloperWidget extends StatefulWidget {
  const HeroDeveloperWidget({super.key});

  @override
  State<HeroDeveloperWidget> createState() => _HeroDeveloperWidgetState();
}

class _HeroDeveloperWidgetState extends State<HeroDeveloperWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _toTopAndToDownAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3500),
    );
    final curveAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _toTopAndToDownAnimation = Tween<double>(
      begin: 30,
      end: 0,
    ).animate(curveAnimation);
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      if (IdentifierDevice.isComputer(context)) {
        _animationController.forward(from: 0);
        _animationController.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = IdentifierDevice.isComputer(context) ? 270 : 140;
    final height = IdentifierDevice.isComputer(context) ? 450 : 140;
    if (!IdentifierDevice.isComputer(context)) {
      return Align(
        alignment: Alignment.topCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            IdentifierDevice.isComputer(context) ? 16 : 140,
          ),
          child: Image.asset(
            IdentifierDevice.isComputer(context)
                ? "assets/images/IMG-20250124-WA0020.jpg"
                : "assets/images/IMG-20241026-WA0091.jpg",
            filterQuality: FilterQuality.high,
            height: height.toDouble(),
            width: width.toDouble(),
            fit:
                IdentifierDevice.isComputer(context)
                    ? BoxFit.fill
                    : BoxFit.fitWidth,
          ),
        ),
      );
    }
    return AnimatedBuilder(
      animation: _animationController,
      builder:
          (context, child) => SizedBox(
            width: width.toDouble(),
            height: height.toDouble() ,
            child: Stack(
              children: [
                Positioned(
                  top: _toTopAndToDownAnimation.value,
                  child: SizedBox(
                    width: width.toDouble() - 30,
                    height: height.toDouble() - 80,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            IdentifierDevice.isComputer(context) ? 16 : 140,
                          ),
                          child: Image.asset(
                            IdentifierDevice.isComputer(context)
                                ? "assets/images/IMG-20250124-WA0020.jpg"
                                : "assets/images/IMG-20241026-WA0091.jpg",
                            filterQuality: FilterQuality.high,
                            height: height.toDouble() - 80,
                            width: width.toDouble() - 30,
                            fit:
                                IdentifierDevice.isComputer(context)
                                    ? BoxFit.fill
                                    : BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          left: -1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              IdentifierDevice.isComputer(context) ? 16 : 140,
                            ),
                            child: SizedBox(
                              width: width.toDouble(),
                              height: height.toDouble(),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(82, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
