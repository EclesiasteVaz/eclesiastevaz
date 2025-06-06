import 'package:eclesiastevaz/utils/identifier_device.dart';
import 'package:eclesiastevaz/widgets/custom_wrap_widget.dart';
import 'package:eclesiastevaz/widgets/hero_developer_widget.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  IdentifierDevice.isComputer(context) ? MediaQuery.sizeOf(context).width * .6 : MediaQuery.sizeOf(context).width * .9,
      height: IdentifierDevice.isComputer(context) ?  MediaQuery.sizeOf(context).height * .7 : MediaQuery.sizeOf(context).height * .9,
      child: Stack(
        children: [
          CustomWrapWidget(
            isRow: (IdentifierDevice.isComputer(context)),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                     width:  !IdentifierDevice.isComputer(context) ? MediaQuery.sizeOf(context).width * .86 : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Olá!, eu sou o "),
                    const SizedBox(height: 20),
                    Text(
                      "Eclesiaste Vaz",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      child: ShaderMask(
                        shaderCallback:
                            (bounds) => LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.deepPurpleAccent,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              
                            ).createShader(
                              Rect.fromLTWH(
                                0,
                                0,
                                bounds.width,
                                bounds.height,
                              ),
                            ),
                        child: Text(
                          'Mobile Developer',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color:
                                Colors
                                    .white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              HeroDeveloperWidget(),
            ],
          ),
        ],
      ),
    );
  }
}