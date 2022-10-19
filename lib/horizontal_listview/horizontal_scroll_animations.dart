import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'data.dart';

class HorizontalScrollAnimations extends StatefulWidget {
  const HorizontalScrollAnimations({super.key});
  static const String routeName = "horizontal-scrollview-animation";
  @override
  State<HorizontalScrollAnimations> createState() =>
      _HorizontalScrollAnimationsState();
}

class _HorizontalScrollAnimationsState
    extends State<HorizontalScrollAnimations> {
  final itemList = data;
  final listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Animations'),
      ),
      body: Center(
        child: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: NotificationListener<ScrollNotification>(
            onNotification: _scrollNotification,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              controller: listScrollController,
              scrollDirection: Axis.horizontal,
              children: itemList
                  .map((e) => AnimatedContainer(
                        curve: Curves.bounceIn,
                        duration: const Duration(milliseconds: 100),
                        transform: Matrix4.rotationZ(
                            scrollDirection == ScrollDirection.forward
                                ? 0.07
                                : scrollDirection == ScrollDirection.reverse
                                    ? -0.07
                                    : 0),
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(int.parse(e["color"].toString())),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(int.parse(e["color"].toString()))
                                      .withOpacity(0.5),
                                  offset: const Offset(-4, 4),
                                  blurRadius: 16),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              e["imagePath"].toString(),
                              height: 120,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              e["title"].toString(),
                              style: const TextStyle(
                                  fontSize: 28, color: Colors.white),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
