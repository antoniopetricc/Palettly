import 'package:flutter/material.dart';
import 'package:palettly/pages/home.dart';
import 'package:palettly/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palettly',
      theme: ThemeData(
        backgroundColor: Styles.kScaffold,
      ),
      home: const HomePage(),
    );
  }
}
