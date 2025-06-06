import 'package:eclesiastevaz/core/models/project_model.dart';
import 'package:eclesiastevaz/utils/identifier_device.dart';
import 'package:eclesiastevaz/widgets/card_project_of_carousel_widget/card_project_of_carousel_widget.dart';
import 'package:flutter/material.dart';

class CarouselProjectsWidget extends StatefulWidget {
  const CarouselProjectsWidget({super.key});

  @override
  State<CarouselProjectsWidget> createState() => _CarouselProjectsWidgetState();
}

class _CarouselProjectsWidgetState extends State<CarouselProjectsWidget> {
  Color backgroundColor = Colors.grey;

  final _scrollController = ScrollController();
  int _currentIndex = 1;

  final _projects = [
    ProjectModel(
      name: "Super Teclas",
      path: "assets/images/projects/super-teclas.png",
      description:
          """É um aplicativo que ajuda o usuário a melhorar a sua flexibilidade em digitação em smartphones, pois
existem pessoas que têm debilidades em digitação, o aplicativo traz consigo um ambiente divertido e
intuitivo para que o mesmo descontraia e passe tempo enquanto melhora cada vez a sua habilidade,
resultando assim em mais inclusão digital. Diminuindo assim o número de pessoas com debilidades e
analfabetismo em questão de técnologias, que no caso são smartphone."""
              .replaceAll(RegExp(r'\n'), ' '),
    ),
    ProjectModel(
      name: "Kitipo",
      path: "assets/images/projects/kitipo.png",
      description:
          """É um aplicativo que ensina os usuários a respeito de tipagem sanguínea, desde o básico que são o
número de grupos, indo para descrição de vantagens e desvantagens de fazer parte de um até o
factor Rh, considerando que estamos em um pais que ainda está no processo de adaptação a
tecnologia, o aplicativo visa a reduzir o número de alfabetismo quando o assunto é tipagem sanguínea
e as vantagens de fazer parte de um certo grupo. Contando que a internet é um problema para alguns
o aplicativo é totalmente offline e com conteúdo de fácil percepção e sendo intuitivo."""
              .replaceAll("\n", ' '),
    ),
    ProjectModel(
      name: "Tradao",
      path: "assets/images/projects/tradao.png",
      description:
          """É um tradutor para multíplos idiomas, contando que um certo idioma as palavras em uma frase
podem variar o seu sentido dependo do contexto em a mesma sem encontra, então integrei o
aplicativo com Gemini AI, para traduzir as frases tirando assim a velha tradução de palavra por palavra
para tradução baseada no contexto e usufriundo assim da percepção avançada de uma IA, criando
um aplicativo inteligente e retirando as melhores novidades do desenvolvimento de software
moderno.""",
    ),
    ProjectModel(
      name: "Lista de tarefas",
      path: "assets/images/projects/lista-de-tarefas.png",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!IdentifierDevice.isComputer(context)) {
      return _generateListView();
    }

    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              if (_currentIndex <= 1) {
                return;
              }
              _scrollController.jumpTo(_scrollController.position.pixels - 250);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            addAutomaticKeepAlives: true,

            controller: _scrollController,
            itemBuilder: (context, index) {
              return SizedBox(
                width: IdentifierDevice.isComputer(context) ? 370 : 330,
                height: 300,
                child: CardProjectOfCarouselWidget(
                  projectModel: _projects[index],
                ),
              );
            },
            itemCount: _projects.length,
          ),
        ),
        if (IdentifierDevice.isComputer(context))
          Expanded(
            child: IconButton(
              onPressed: () {
                _scrollController.jumpTo(
                  _scrollController.position.pixels + 250,
                );
                _currentIndex++;
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
      ],
    );
  }

  Widget _generateListView() {
    if (!IdentifierDevice.isComputer(context)) {
      return SizedBox(
        width: MediaQuery.sizeOf(context).width * .9,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          addAutomaticKeepAlives: true,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (!IdentifierDevice.isComputer(context)) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CardProjectOfCarouselWidget(
                  projectModel: _projects[index],
                ),
              );
            }

            return SizedBox(
              width: 280,
              height: 280,
              child: CardProjectOfCarouselWidget(
                projectModel: _projects[index],
              ),
            );
          },
          itemCount: _projects.length,
        ),
      );
    }

    return Expanded(
      flex: 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        addAutomaticKeepAlives: true,

        controller: _scrollController,
        itemBuilder: (context, index) {
          return SizedBox(
            width: IdentifierDevice.isComputer(context) ? 370 : 330,
            height: 300,
            child: CardProjectOfCarouselWidget(projectModel: _projects[index]),
          );
        },
        itemCount: _projects.length,
      ),
    );
  }
}
