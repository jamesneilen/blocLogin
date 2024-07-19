import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
        title: 'Log me in',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
