import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_animation/models/shoe.dart';
import '../../data.dart';

class HorizontalScrollAnimations extends StatefulWidget {
  const HorizontalScrollAnimations({super.key});
  static const String routeName = "horizontal-scrollview-animation";
  @override
  State<HorizontalScrollAnimations> createState() =>
      _HorizontalScrollAnimationsState();
}

class _HorizontalScrollAnimationsState
    extends State<HorizontalScrollAnimations> {
  List<Shoe> itemList = [];
  final listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    itemList = Shoe.getData(data);
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
                            color: Color(e.color),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(e.color).withOpacity(0.5),
                                  offset: const Offset(-4, 4),
                                  blurRadius: 16),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              e.imageUrl,
                              height: 120,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              e.title,
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
