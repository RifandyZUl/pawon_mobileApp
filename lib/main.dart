import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/onboarding/on_boarding.dart';
import 'screen/auth/login_screen.dart';
import 'screen/choose_steps/choose_language_screen.dart';
import 'screen/auth/password_reset/password_reset_confirm_screen.dart';
import 'screen/auth/password_reset/new_password_reset_screen.dart';
import 'providers/saved_recipes_provider.dart';
import 'services/api_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedRecipesProvider()),
      ],
      child: const MyApp(),
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
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const OnboardingScreen());
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/language-selection':
            return MaterialPageRoute(builder: (context) => ChooseLanguageScreen());
          case '/password-reset':
            return MaterialPageRoute(builder: (context) => PasswordResetScreen());
          case '/set-new-password':
            return MaterialPageRoute(builder: (context) => const NewPasswordResetScreen());
          default:
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: const Text("Page Not Found")),
                body: const Center(child: Text("404 - Page Not Found")),
              ),
            );
        }
      },
    );
  }
}
