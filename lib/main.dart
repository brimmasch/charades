import 'package:flutter/material.dart';
import 'models/category.dart';
import 'screens/splash_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/game_setup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CharadesApp());
}

class CharadesApp extends StatelessWidget {
  const CharadesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charades',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/categories': (_) => const CategoriesScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/game-start') {
          final category = settings.arguments as Category;
          return MaterialPageRoute(
            builder: (_) => GameSetupScreen(category: category),
          );
        }
        return null;
      },
    );
  }
}
