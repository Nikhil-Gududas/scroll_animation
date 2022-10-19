import 'package:flutter/material.dart';
import 'package:scroll_animation/horizontal_listview/horizontal_scroll_animations.dart';
import 'package:scroll_animation/shrink_top_list/shrink_top_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = "home-page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            routeButton(context, HorizontalScrollAnimations.routeName),
            routeButton(context, ShrinkTopList.routeName),
          ],
        ),
      ),
    );
  }

  SizedBox routeButton(BuildContext context, String routeName) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Text(routeName)),
    );
  }
}
