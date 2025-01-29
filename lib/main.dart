import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/onboarding/on_boarding.dart';
import 'screen/auth/login_screen.dart';
import 'screen/choose_steps/choose_language_screen.dart';
import 'screen/auth/password_reset/password_reset_confirm_screen.dart';
import 'screen/auth/password_reset/new_password_reset_screen.dart';
import 'providers/saved_recipes_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedRecipesProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAWON',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light, // Tema terang
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark, // Tema gelap
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // Ikuti tema sistem perangkat
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/language-selection': (context) => ChooseLanguageScreen(),
        '/password-reset': (context) => PasswordResetScreen(),
        '/set-new-password': (context) => const NewPasswordResetScreen(),
      },
    );
  }
}
