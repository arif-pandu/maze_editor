import 'package:flutter/material.dart';
import 'package:map_generator/provider/main_provider.dart';
import 'package:map_generator/widget/copy_button.dart';
import 'package:map_generator/widget/delete_button.dart';
import 'package:map_generator/widget/edit_button.dart';
import 'package:map_generator/widget/grid.dart';
import 'package:map_generator/widget/reset_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<MainProvider>(
          builder: (context, mainProv, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50.h,
                  width: (50 / 4 * 6).h,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(
                      width: 2,
                      color: mainProv.editState == EditState.edit ? Colors.black : Colors.red,
                    ),
                  ),
                  child: GridMaze(
                    gridSize: Size((50 / 4 * 6).h, 50.h),
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 30.w,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ResetButton(
                        onTap: () {
                          mainProv.resetMaze();
                        },
                      ),
                      CopyButton(
                        onTap: () {
                          mainProv.copyMaze();
                        },
                      ),
                      EditButton(
                        onTap: () {
                          mainProv.editMazeState();
                        },
                      ),
                      DeleteButton(
                        onTap: () {
                          mainProv.deleteMazeState();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
