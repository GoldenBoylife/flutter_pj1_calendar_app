
import 'package:flutter/material.dart';

import 'views/daypage.dart';
import  'views/weekPage.dart';
import  'views/home.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page:()=> Home()),
        GetPage(name: "/week", page:()=>WeekPage()),
        GetPage(name: "/day", page:()=>DayPage())

      ,

      ]
    );
  }
}
