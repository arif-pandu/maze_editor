import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum EditState {
  edit,
  delete,
}

class MainProvider with ChangeNotifier {
  List<Color> listColor = List.generate(2400, (index) => Colors.grey);
  EditState editState = EditState.edit;

  void setColorBox(int selectedIndex) {
    listColor[selectedIndex] = Colors.black87;
    notifyListeners();
  }

  void resetColorBox(int selectedIndex) {
    listColor[selectedIndex] = Colors.grey;
    notifyListeners();
  }

  void resetMaze() {
    listColor = List.generate(2400, (index) => Colors.grey);
    notifyListeners();
  }

  Future<void> copyMaze() async {
    List<int> tempList = [];

    for (var i = 0; i < listColor.length; i++) {
      if (listColor[i] == Colors.black87) {
        tempList.add(i + 1);
      }
    }
    String result = tempList.toString().replaceAll("]", "").replaceAll("[", "");

    Clipboard.setData(ClipboardData(text: result));
  }

  void editMazeState() {
    editState = EditState.edit;
    notifyListeners();
  }

  void deleteMazeState() {
    editState = EditState.delete;
    notifyListeners();
  }

  void applyInput({required List<int> walls}) {
    for (var ele in walls) {
      listColor[ele - 1] = Colors.black87;
    }
    notifyListeners();
  }
}
