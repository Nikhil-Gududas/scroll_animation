import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../models/shoe.dart';

class ShoeDetailScreen extends StatelessWidget {
  const ShoeDetailScreen({super.key, required this.shoe});
  final Shoe shoe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(shoe.color),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Text(
                shoe.title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                children: [
                  Material(
                      color: Colors.transparent,
                      child: Text(
                        shoe.title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Transform.rotate(
                      angle: -math.pi / 11.5,
                      alignment: Alignment.center,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.network(
                          shoe.imageUrl,
                          width: 250,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
