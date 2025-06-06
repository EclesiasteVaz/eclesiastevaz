class CareerJourney {
  final String organizationName;
  final String role;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String modality;
  final bool isFinished;

  CareerJourney({
    required this.organizationName,
    required this.role,
    required this.modality,
    this.dateStart,
    this.dateEnd,
    this.isFinished = true
  });
}
