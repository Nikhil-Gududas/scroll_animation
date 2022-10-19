import 'package:flutter/material.dart';
import './horizontal_listview/horizontal_scroll_animations.dart';
import './shrink_top_list/shrink_top_list.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        HorizontalScrollAnimations.routeName: (context) =>
            const HorizontalScrollAnimations(),
        ShrinkTopList.routeName: (context) => const ShrinkTopList(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
