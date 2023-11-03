import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  final double width;
  final double height;
  final double r;
  final String image;
  const CustomBookItem({
    super.key,
    required this.width,
    required this.height,
    required this.r,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
       borderRadius: BorderRadius.all(Radius.circular(r)),
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: image,
        fit: BoxFit.cover,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(r)),
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: CachedNetworkImageProvider(image),
        //   ),
        // ),
      ),
    );
  }
}
