enum Technnologies<String> { flutter, laravel, mysql,}

extension TechnnologyPathImage on Technnologies {
  String get path {
    switch (this) {
      case Technnologies.flutter:
        return "assets/images/tools/Flutter.png";

      case Technnologies.laravel:
        return "assets/images/tools/Laravel.png";

      case Technnologies.mysql:
        return "assets/images/tools/MySQL.png";
    }
  }
}
