import 'package:flutter/material.dart';
import 'package:map_generator/provider/main_provider.dart';
import 'package:map_generator/screen/home.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainProvider(),
        ),
      ],
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              theme: ThemeData(useMaterial3: true),
              home: HomeScreen(),
            );
          },
        );
      },
    );
  }
}
