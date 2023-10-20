import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/web_services/books_webservice.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomeRepoInterface {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}

class HomeRepoImpl implements HomeRepoInterface {
  final BooksWebservices booksWebservices;

  HomeRepoImpl({required this.booksWebservices});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      final result = await booksWebservices.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:Programming');

      List<BookModel> books = [];
      for (Map<String, dynamic> item in result['items']) {
        books.add(BookModel.fromJson(item));
      }

      return Right(books);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try {
      final result = await booksWebservices.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:Programming');

      List<BookModel> featuredBooks = [];
      for (Map<String, dynamic> item in result['items']) {
        featuredBooks.add(BookModel.fromJson(item));
      }

      return Right(featuredBooks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
