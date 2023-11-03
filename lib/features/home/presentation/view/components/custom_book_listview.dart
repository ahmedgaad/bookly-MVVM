import 'package:bookly/features/home/presentation/view/components/custom_book_item.dart';
import 'package:bookly/features/home/presentation/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksListViewHorizontal extends StatelessWidget {
  const BooksListViewHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, value, ___) {
      return SizedBox(
        height: 225,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final image = value.books[index].volumeInfo.imageLinks!.thumbnail;
            return CustomBookItem(
              width: 150,
              height: 224,
              r: 25,
              image: image ?? '',
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: context.read<HomeController>().books.length,
        ),
      );
    });
  }
}
