
import 'package:eclesiastevaz/utils/identifier_device.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/journleys_widget.dart';

import '../widgets/carousel_projects_widget.dart';
import 'dart:ui';

import 'package:eclesiastevaz/widgets/show_frameworks_widget.dart';

import '../widgets/banner_widget.dart';
import 'package:eclesiastevaz/widgets/body_page_widget.dart';
import 'package:eclesiastevaz/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,

            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(10),
                  colors: [
                    const Color.fromARGB(255, 20, 28, 34),
                    const Color.fromARGB(255, 29, 32, 37),
                    const Color.fromARGB(255, 66, 36, 119),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: BodyPageWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 60,
                  children: [
                    if(IdentifierDevice.isComputer(context))
                    const SizedBox(height: 60),
                    BannerWidget(),
                    Center(child: ShowFrameworksWidget()),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Projectos pessoias - publicados",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: IdentifierDevice.isComputer(context) ? MediaQuery.sizeOf(context).width * .6 : MediaQuery.sizeOf(context).width * .9,
                          height:IdentifierDevice.isComputer(context) ? 500 : 300,
                          child: CarouselProjectsWidget(),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Minha jornada profissional",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        CarrerJourneyWidget(),
                      ],
                    ),

                    Column(
                      spacing: 30,
                      children: [
                        Text(
                          "Contactos",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        ShowContactsWidget(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("eclesiastevaz©2025"),
                          ],
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(30)),
                  ],
                ),
              ),
            ),
          ),

          /// app ba
          if(IdentifierDevice.isComputer(context))
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ColoredBox(
                    color: Colors.green.withAlpha(0),
                    child: CustomAppBar(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowContactsWidget extends StatelessWidget {
  const ShowContactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: IdentifierDevice.isComputer(context) ? 120 : 40,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            _openOtherWebApp("mailto:eclesiastevaz884@gmail.com");
          },
          child: Icon(FontAwesomeIcons.google),
        ),
        InkWell(
          onTap: () {
            _openOtherWebApp("https://www.linkedin.com/in/eclesiaste-vaz/");
          },
          child: Icon(FontAwesomeIcons.linkedinIn),
        ),
        InkWell(
          onTap: () {
            _openOtherWebApp("https://www.facebook.com/profile.php?id=100084698768943");
          },
          child: Icon(FontAwesomeIcons.facebook),
        ),
      ],
    );
  }

  Future<void> _openOtherWebApp(String url) async {
    final uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      return;
    }
    await launchUrl(uri);
  }
}
