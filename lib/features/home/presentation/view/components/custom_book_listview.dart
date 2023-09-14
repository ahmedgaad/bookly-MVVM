import 'package:bookly/features/home/presentation/view/components/custom_book_item.dart';
import 'package:flutter/material.dart';

class BooksListViewHorizontal extends StatelessWidget {
  const BooksListViewHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const CustomBookItem(),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 5,
      ),
    );
  }
}
