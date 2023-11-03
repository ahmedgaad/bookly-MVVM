import 'package:bookly/features/home/data/models/books/books.dart';
import 'package:flutter/material.dart';

class RateItem extends StatelessWidget {
  const RateItem({
    super.key,
    required this.book,
  });

  final Books book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (book.saleInfo!.listPrice != null)
          Text(
            '${book.saleInfo!.listPrice?.amount} ${book.saleInfo!.listPrice!.currencyCode}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        const Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xffFFDD4F),
                ),
                SizedBox(width: 3),
                Text(
                  '4.8',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(width: 5),
            Text(
              '(2390)',
              style: TextStyle(color: Color(0xff707070)),
            )
          ],
        ),
      ],
    );
  }
}
