import 'package:get_it/get_it.dart';
import 'package:white_jotter_app/viewmodel/folder_viewmodel.dart';
import 'home_viewmodel.dart';
import 'login_viewmodel.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  // serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
  // serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());
  //
  // // You can replace the actual services above with fake implementations during development.
  //
  // // view models
  serviceLocator.registerFactory<HomeIndexViewModel>(() => HomeIndexViewModel());
  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel());
  serviceLocator.registerFactory<FolderViewModel>(() => FolderViewModel());

}