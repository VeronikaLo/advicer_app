

import 'package:get_it/get_it.dart';

import 'application/bloc/advicer_bloc.dart';
import 'data/datasources/advicer_remote_datasourse.dart';
import 'data/repositories/advicer_repository_impl.dart';
import 'domain/repositories/advicer_repository.dart';
import 'domain/usecases/advicer_usecases.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;  // sl == service Locator

Future<void> init()async{

  //! application layer 
  sl.registerFactory(() => AdvicerBloc(usecases: sl()));

  //! Usecases
  sl.registerLazySingleton(() => AdvicerUsecases(advicerRepository: sl()));

  //! repos
  sl.registerLazySingleton<AdvicerRepository>(() => AdvicerRepositoryImpl(advicerRemoteDatasource: sl()));

  //! datasources
  sl.registerLazySingleton<AdvicerRemoteDatasource>(() => AdvicerRemoteDatasourceImpl(client: sl()));

  //! extern
sl.registerLazySingleton(() => http.Client());






















}