import 'package:flutter/material.dart';
import 'package:news_api_practice/controller/news_screen_controler.dart';
import 'package:news_api_practice/view/news_screen/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NewsScreenControler(),
          )
        ],
        child: MaterialApp(
          home: NewsScreen(),
        ));
  }
}
