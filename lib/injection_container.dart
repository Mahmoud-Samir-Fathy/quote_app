import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quote/core/api/api_consumer.dart';
import 'package:quote/core/api/dio_consumer.dart';
import 'package:quote/core/network/network_info.dart';
import 'package:quote/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quote/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quote/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:quote/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quote/features/splash/data/data_sources/lang_local_data_source.dart';
import 'package:quote/features/splash/data/repositories/lang_repository_impl.dart';
import 'package:quote/features/splash/domain/repositories/lang_repository.dart';
import 'package:quote/features/splash/domain/use_cases/change_lang.dart';
import 'package:quote/features/splash/domain/use_cases/get_saved_lang.dart';
import 'package:quote/features/splash/presentation/cubit/local_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/app_interceptor.dart';
import 'features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'features/random_quote/domain/repositories/quote_repository.dart';

final sl=GetIt.instance;

Future<void> init()async{
//! Feature

//bloc
sl.registerFactory<RandomQuoteCubit>(()=>RandomQuoteCubit(getRandomQuoteUseCase: sl()));
sl.registerFactory<LocalCubit>(()=>LocalCubit(changeLangUseCase: sl(), getSavedLangUseCase: sl()));

//use case

sl.registerLazySingleton<GetRandomQuote>(()=>GetRandomQuote(quoteRepository: sl()));
sl.registerLazySingleton<ChangeLangUseCase>(()=>ChangeLangUseCase(langRepository: sl()));
sl.registerLazySingleton<GetSavedLangUseCase>(()=>GetSavedLangUseCase(langRepository: sl()));


//repository

sl.registerLazySingleton<QuoteRepository>(()=>QuoteRepositoryImpl(
    randomQuoteRemoteDataSource: sl(),
    randomQuoteLocalDataSource: sl(),
    networkInfo: sl()));
sl.registerLazySingleton<LangRepository>(()=>LangRepositoryImpl(langLocalDataSource: sl()));



//data source
sl.registerLazySingleton<RandomQuoteRemoteDataSource>(()=>RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));
sl.registerLazySingleton<RandomQuoteLocalDataSource>(()=>RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
sl.registerLazySingleton<LangLocalDataSource>(()=>LangLocalDataSourceImpl(sharedPreferences: sl()));

//! core

sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(connectionChecker:sl()));
sl.registerLazySingleton<ApiConsumer>(()=>DioConsumer(client: sl()));


//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(()=>AppInterceptor());
  sl.registerLazySingleton(()=>LogInterceptor(
    requestBody: true,
    request: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    error: true,
  ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(()=>Dio());


}