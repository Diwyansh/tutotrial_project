import 'package:ecommerce_project/features/auth/bloc/bloc_cubit.dart';
import 'package:ecommerce_project/features/auth/login_screen.dart';
import 'package:ecommerce_project/features/dashboard/dashboard.dart';
import 'package:ecommerce_project/features/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Splash(),
        routes: {
          "dashboard" : (context) => Dashboard(),
          "signIn" : (context) => SignInPage(),
        },
      ),
    );
  }
}


