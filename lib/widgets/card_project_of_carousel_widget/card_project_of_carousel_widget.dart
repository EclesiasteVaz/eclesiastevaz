import 'dart:ui';

import 'package:eclesiastevaz/core/models/project_model.dart';
import 'package:eclesiastevaz/utils/identifier_device.dart';
import 'package:eclesiastevaz/widgets/card_project_of_carousel_widget/stores/card_project_store/card_project_store.dart';
import 'package:flutter/material.dart';

class CardProjectOfCarouselWidget extends StatefulWidget {
  final ProjectModel projectModel;
  const CardProjectOfCarouselWidget({super.key, required this.projectModel});

  @override
  State<CardProjectOfCarouselWidget> createState() =>
      _CardProjectOfCarouselWidgetState();
}

class _CardProjectOfCarouselWidgetState
    extends State<CardProjectOfCarouselWidget>
    with AutomaticKeepAliveClientMixin {
  final _cardProjectStore = CardProjectStore();

  @override
  void initState() {
    super.initState();
    _cardProjectStore.useImageForGetColor(AssetImage(widget.projectModel.path));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListenableBuilder(
      listenable: _cardProjectStore,
      builder: (context, __) {
        return InkWell(
          onTap: _cardProjectStore.toogleShowInformation,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: ColoredBox(
                  color: _cardProjectStore.state.color,
                  child: SizedBox(
                    width:
                        IdentifierDevice.isComputer(context)
                            ? MediaQuery.sizeOf(context).width
                            : 260,
                    height: IdentifierDevice.isComputer(context) ? 500 : 300,
                    child: Image.asset(
                      widget.projectModel.path,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              if (_cardProjectStore.state.showInformation)
                Positioned.fill(
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: IdentifierDevice.isComputer(context) ? ImageFilter.blur(sigmaX: 5, sigmaY: 5) : ImageFilter.dilate(),
                      child: ColoredBox(
                        color: const Color.fromARGB(201, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 40,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: 15,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  widget.projectModel.name,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineLarge?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  widget.projectModel.description ??
                                      'A descrição não está disponível',
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  void showDialogAboutProject() {
    showDialog(context: context, builder: (context) => DialogAboutProject());
  }
}

class DialogAboutProject extends StatelessWidget {
  const DialogAboutProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.red,
      child: SingleChildScrollView(
        child: SizedBox(
          width: IdentifierDevice.isComputer(context) ? 500 : 350,
          height: 600,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(0),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 20, 28, 34),
                  const Color.fromARGB(255, 29, 32, 37),
                  const Color.fromARGB(255, 66, 36, 119),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
