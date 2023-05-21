import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth/authentication_screen.dart';
import 'features/auth/controller/authentication_controller.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/profile/profile_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authProvider);

    Widget getHome() {
      if (authenticationState.status == AuthenticationStatus.authenticated) {
        return const ProfileScreen();
      } else if (authenticationState.status ==
          AuthenticationStatus.unauthenticated) {
        return const AuthenticationScreen();
      } else {
        return const AuthenticationScreen();
      }
    }

    return MaterialApp(
      theme: ThemeData(),
      home: getHome(),
    );
  }
}
