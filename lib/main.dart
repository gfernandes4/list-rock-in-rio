import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock in Rio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor, // Cor principal
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: accentColor,  // Defina a cor de destaque aqui
        ), // Cor de destaque
        // Cor de fundo
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor, // Cor da AppBar
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}