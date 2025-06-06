import 'package:eclesiastevaz/core/models/career_journey.dart';
import 'package:flutter/material.dart';

class CarrerJourneyWidget extends StatefulWidget {
  const CarrerJourneyWidget({super.key});

  @override
  State<CarrerJourneyWidget> createState() => _CarrerJourneyWidgetState();
}

class _CarrerJourneyWidgetState extends State<CarrerJourneyWidget> {
  final _currentStep = ValueNotifier(0);
  final _journeys = [
    CareerJourney(organizationName: "Zutic", role: "Desenvolvedor Flutter", modality: "Presencial" ,dateEnd: DateTime(2025, 3, 15), dateStart: DateTime(2024, 11, 19)),
    CareerJourney(organizationName: "Mamadu Digital", role: "Programador Flutter", dateStart: DateTime(2025, 4, 2), modality: "Remoto" ),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentStep,
      builder: (context, _, __) {
        return Stepper(
          onStepTapped: (value) => _currentStep.value = value,
          currentStep: _currentStep.value,
          controlsBuilder: (context, ___) => Container(),

         
          steps: _journeys.map((journey) => Step(

            title: Text(journey.organizationName),
            content: Container(),
            subtitle: Text("${journey.role} | ${journey.modality}")
          )).toList(),
        );
      },
    );
  }
}
