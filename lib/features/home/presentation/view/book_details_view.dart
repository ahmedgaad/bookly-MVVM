import 'package:bookly/features/home/data/models/books/books.dart';
import 'package:bookly/features/home/presentation/view/components/custom_book_item.dart';
import 'package:bookly/features/home/presentation/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final Books book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                CustomBookItem(
                  width: 150,
                  height: 224,
                  r: 25,
                  image: book.volumeInfo.imageLinks!.thumbnail ?? '',
                ),
                const SizedBox(height: 40),
                Text(
                  book.volumeInfo.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  book.volumeInfo.authors!.first,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFDD4F),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          book.volumeInfo.categories!.first,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '(2390)',
                      style: TextStyle(color: Color(0xff707070)),
                    )
                  ],
                ),
                const SizedBox(height: 37),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37.5),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            minimumSize: const Size(150, 48),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(15),
                                bottomStart: Radius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            '19.99€',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xffEF8262),
                            minimumSize: const Size(150, 48),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(15),
                                bottomEnd: Radius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Free preview',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox(height: 49)),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 33),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 33),
                  child: SizedBox(
                    height: 135,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final imageUrl = context
                            .read<HomeController>()
                            .books[index]
                            .volumeInfo
                            .imageLinks!
                            .smallThumbnail;
                        return CustomBookItem(
                          height: 150,
                          width: 87,
                          r: 8,
                          image: imageUrl ?? '',
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 18)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
