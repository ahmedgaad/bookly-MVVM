import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final HomeRepoInterface homeRepoInterface;

  HomeController({required this.homeRepoInterface});


  Future<void> fetchNewestBooks() async {
    final newestBooks = await homeRepoInterface.fetchNewestBooks();
    newestBooks.fold(
      (failure) {
        notifyListeners();
      },
      (newestBooks) => null,
    );
  }
}