import 'package:flutter/material.dart';
import 'package:test_app/core/themes/theme.dart';
import 'package:test_app/features/photolist/presentation/pages/list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      home: const ListPage(),
    );
  }
}
