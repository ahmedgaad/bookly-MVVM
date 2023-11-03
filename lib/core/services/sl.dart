import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/data/web_services/books_webservice.dart';
import 'package:bookly/features/home/presentation/view_model/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> initLocator() async {
  //* Controllers
  sl.registerLazySingleton(() => HomeController(homeRepoInterface: sl()));
  //* Repository
  sl.registerLazySingleton<HomeRepoInterface>(
      () => HomeRepoImpl(booksWebservices: sl()));

  //* Web Services
  sl.registerLazySingleton(() => BooksWebservices(sl()));

  //! External
  sl.registerLazySingleton(() => Dio());
}
