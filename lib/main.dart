import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_news/controller/provider/news_provider.dart';
import 'package:get_news/view/homepage/homepage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<NewsProvider>(
              create: (context) => NewsProvider())
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      );
      // return
    });
  }
}
