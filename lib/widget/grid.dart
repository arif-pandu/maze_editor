import 'package:flutter/material.dart';
import 'package:map_generator/provider/main_provider.dart';
import 'package:provider/provider.dart';

class GridMaze extends StatefulWidget {
  const GridMaze({
    super.key,
    required this.gridSize,
  });
  final Size gridSize;

  @override
  State<GridMaze> createState() => _GridMazeState();
}

class _GridMazeState extends State<GridMaze> {
  double boxSize = 0.0;
  @override
  void initState() {
    super.initState();
    boxSize = (widget.gridSize.width / 60);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, mainProv, _) {
      return GestureDetector(
        onPanUpdate: (details) {
          int selectedIndex = getIndexByPosition(
            details.localPosition,
            boxSize,
            widget.gridSize,
          );

          if (selectedIndex <= 2399 || selectedIndex >= 0) {
            if (mainProv.editState == EditState.edit) {
              mainProv.setColorBox(selectedIndex);
            } else {
              mainProv.resetColorBox(selectedIndex);
            }
          }
        },
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: GridView.builder(
            itemCount: 2400,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 60),
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 20),
                decoration: BoxDecoration(
                  color: mainProv.listColor[index],
                ),
                margin: const EdgeInsets.all(1),
              );
            },
          ),
        ),
      );
    });
  }
}

int getIndexByPosition(
  Offset localPos,
  double boxSize,
  Size gridSize,
) {
  int posX = (localPos.dx ~/ boxSize);
  int posY = (localPos.dy ~/ boxSize);

  int locIndex = (posY * 60) + posX;

  return locIndex;
}
