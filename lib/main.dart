import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/style.dart';
import 'ui/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: const HomeView(),
    );
  }
}
