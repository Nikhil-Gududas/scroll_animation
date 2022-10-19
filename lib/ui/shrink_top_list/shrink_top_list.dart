import 'package:flutter/material.dart';
import 'package:scroll_animation/ui/shrink_top_list/shoe_detail_screen.dart';
import '../../data.dart';
import '../../models/shoe.dart';

class ShrinkTopList extends StatefulWidget {
  const ShrinkTopList({super.key});
  static const routeName = 'Shrink-Top-List';

  @override
  State<ShrinkTopList> createState() => _ShrinkTopListState();
}

class _ShrinkTopListState extends State<ShrinkTopList> {
  final scrollController = ScrollController();
  final double itemSize = 150;
  List<Shoe> shoes = [];
  void onListen() {
    // print('scrollController ${scrollController.offset}');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    shoes = Shoe.getData(data);
    shoes.addAll(List<Shoe>.from(shoes));
    scrollController.addListener(onListen);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(onListen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shrink Top List')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 250,
                color: Colors.purple,
              ),
            ),
            const SliverAppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Shoes',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: shoes.length,
              (context, index) {
                final shoe = shoes[index];
                final itemPositionOffset = index * itemSize * 0.5;
                final difference = scrollController.offset - itemPositionOffset;
                final percent = 4.5 - (difference / (itemSize * 0.5));
                double opacity = percent;
                double scale = percent;
                if (opacity > 1.0) opacity = 1.0;
                if (opacity < 0.0) opacity = 0.0;
                if (percent > 1.0) scale = 1.0;
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoeDetailScreen(shoe: shoe),
                      )),
                  child: Align(
                    heightFactor: 0.5,
                    child: Opacity(
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(scale, 1.0),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                          ),
                          color: Color(shoe.color),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: itemSize,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    shoe.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Image.network(
                                  shoe.imageUrl,
                                  width: 150,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
