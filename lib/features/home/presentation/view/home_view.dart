import 'package:bookly/features/home/presentation/view/book_details_view.dart';
import 'package:bookly/features/home/presentation/view/components/app_bar.dart';
import 'package:bookly/features/home/presentation/view/components/custom_best_seller_book_item.dart';
import 'package:bookly/features/home/presentation/view/components/custom_book_listview.dart';
import 'package:bookly/features/home/presentation/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverAppBar(
                pinned: false,
                floating: false,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BooksListViewHorizontal(),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 16, top: 50),
                        child: Text(
                          'Best Seller',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const BooksListViewHorizontal(),
              //       Padding(
              //         padding: const EdgeInsetsDirectional.only(start: 16,top: 50),
              //         child: Text(
              //           'Best Seller',
              //           style: Theme.of(context).textTheme.titleMedium,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SliverList(
                // hasScrollBody: true,
                delegate: SliverChildListDelegate(value.books.map((book) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 16.0,
                      top: 15,
                      end: 16,
                      bottom: 10,
                    ),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetailsView(book: book),
                            ),
                          );
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: CustomBestSellerBookItem(book: book)),
                  );
                }).toList()),

                // child: Padding(
                //   padding: const EdgeInsetsDirectional.only(
                //     start: 16.0,
                //     top: 20,
                //     end: 16,
                //   ),
                //   child: ListView.separated(
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       final book = value.books[index];
                //       return InkWell(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) =>
                //                     BookDetailsView(book: book),
                //               ),
                //             );
                //           },
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(10)),
                //           child: CustomBestSellerBookItem(book: book));
                //     },
                //     separatorBuilder: (context, index) =>
                //         const SizedBox(height: 24),
                //     itemCount: value.books.length,
                //   ),
                // ),
              )
            ],
          );
        },
      ),
    );
  }
}
