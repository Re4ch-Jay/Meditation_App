import 'package:flutter/material.dart';
import './pages/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.white,
            ),
            padding: MaterialStatePropertyAll(
              EdgeInsets.all(20),
            ),
            elevation: MaterialStatePropertyAll(0),
          ),
        ),
      ),
      home: const Home(),
    );
  }
}
