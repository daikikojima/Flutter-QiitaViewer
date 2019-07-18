import 'package:flutter/material.dart';
import 'package:qiita_viewer/article_page.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita Viewer',
      theme: ThemeData(
        //0xFF59bb0c
        primaryColor: Color(0xFF59bb0c),
      ),
      routes: <String, WidgetBuilder> {
        'article_page': (BuildContext context) => new ArticlePage(url: "", title: ""),
      },
      home: HomePage(),
    );
  }
}
