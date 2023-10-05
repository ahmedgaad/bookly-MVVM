import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  final double width;
  final double height;
  final double r;
  const CustomBookItem({
    super.key,
    required this.width,
    required this.height,
    required this.r,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(r)),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
              'https://plus.unsplash.com/premium_photo-1682146720153-4d5bdf56f143?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
        ),
      ),
    );
  }
}
