import 'dart:developer';

import 'package:bookly/features/home/data/models/books/books.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final HomeRepoInterface homeRepoInterface;

  HomeController({required this.homeRepoInterface});

  List<Books> books = [];
  bool isLoading = false;
  Future<void> fetchNewestBooks() async {
    books.clear();
    final newestBooks = await homeRepoInterface.fetchNewestBooks();
    newestBooks.fold(
      (failure) {
        log(failure.errorMessage);
        notifyListeners();
      },
      (newestBooks) {
        if (newestBooks.isEmpty) {
          isLoading = true;
        } else {
          books.addAll(newestBooks);
          log(newestBooks.toString());
          isLoading = false;
        }
        log(isLoading.toString());
        notifyListeners();
      },
    );
  }
}
