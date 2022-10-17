import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'configurations/front_end.dart';
import 'firebase_options.dart';
import 'navigation/route_generator.dart';
import 'navigation/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HabitBuilder());
}

class HabitBuilder extends StatelessWidget {
  const HabitBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.black26));
    return MaterialApp(
      title: 'Habit Builder',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: FrontEndConfigs.kPrimaryColor,
          secondary: FrontEndConfigs.kSecondaryColor,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splashViewRoute,
      onGenerateRoute: RoutesGenerator.generateRoute,
    );
  }
}
