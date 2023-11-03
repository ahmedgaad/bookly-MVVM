import 'package:bookly/features/home/data/models/books/books.dart';
import 'package:bookly/features/home/presentation/view/components/custom_rate_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBestSellerBookItem extends StatelessWidget {
  const CustomBestSellerBookItem({
    super.key,
    required this.book,
  });

  final Books book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 105,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    book.volumeInfo.imageLinks!.thumbnail ?? ''),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  child: Text(
                    book.volumeInfo.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontFamily: GoogleFonts.inter().fontFamily),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  book.volumeInfo.authors!.first ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                RateItem(
                  book: book,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
