import 'package:dash_news/providers/article_provider.dart';
import 'package:dash_news/screens/top_headlines_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  // this app works best on portrait mode.
  // these lines of codes prevents landscape mode.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticleProvider()),
      ],
      child: MaterialApp(
        title: 'Dash News',
        debugShowCheckedModeBanner: false,
        home: TopHeadlinesScreen(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
          fontFamily: 'Ubuntu',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: CupertinoColors.activeGreen,
          ),
        ),
      ),
    );
  }
}
