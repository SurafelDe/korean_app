import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:korean_app/page/home_tabbed_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    title: 'Korean App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomeTabbedPage(),
  ));
}
