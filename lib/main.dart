import 'package:blood_bank_fyp/routes/routes.dart';
import 'package:blood_bank_fyp/routes/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
      // home: SplashScreen(),
    );
  }
}
