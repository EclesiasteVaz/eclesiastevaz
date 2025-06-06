import 'package:eclesiastevaz/core/enums/technnologies.dart';

class ProjectModel {
  final String name;
  final String path;
  final String? description;
  final List<Technnologies> technnologies;
  ProjectModel({required this.name, required this.path, this.description, this.technnologies = const  []});
}
