import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

part 'card_project_state.dart';

class CardProjectStore extends ChangeNotifier {
  final _state = CardProjectState();
  CardProjectState get state => _state;

  void changeColor(Color color) {
    _state.color = color;
    notifyListeners();
  }

  void toogleShowInformation() {
    _state.showInformation = !_state.showInformation;
    notifyListeners();
  }


  Future<void> useImageForGetColor(ImageProvider provider) async {

    final paletterGenerator = await PaletteGenerator.fromImageProvider(
      provider,
    );
   changeColor(
        paletterGenerator.dominantColor?.color ?? Colors.grey);
  
  }
}
