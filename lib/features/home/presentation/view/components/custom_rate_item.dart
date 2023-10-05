
import 'package:flutter/material.dart';

class RateItem extends StatelessWidget {
  const RateItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '19.99 €',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Row(
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
