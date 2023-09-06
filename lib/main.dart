import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasbhi_counter/tasbhi_counter_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasbhiCounterPage(),
    );
  }
}

