import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'ui/gallery_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Serverpod Client via our ApiService singleton
  // This sets up the authentication manager and connectivity monitor
  ApiService().init();
  
  runApp(const ReceiptFinderApp());
}

class ReceiptFinderApp extends StatelessWidget {
  const ReceiptFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipt Butler',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const GalleryScreen(),
    );
  }
}
