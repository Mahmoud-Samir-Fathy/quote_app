import 'package:dartz/dartz.dart';
import 'package:quote/core/error/failures.dart';
import 'package:quote/core/network/network_info.dart';
import 'package:quote/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:quote/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quote/features/random_quote/domain/entities/quote.dart';
import 'package:quote/features/random_quote/domain/repositories/quote_repository.dart';
import '../../../../core/error/exceptions.dart';

class QuoteRepositoryImpl implements QuoteRepository{
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  final NetworkInfo networkInfo;

  QuoteRepositoryImpl({
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
    required this.networkInfo
  });


  @override
  Future<Either<Failures, Quote>> getRandomQuoteRepository() async{
    if(await networkInfo.isConnected){
      try{
        final randomRemoteQuote= await randomQuoteRemoteDataSource.getRemoteRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(randomRemoteQuote);

        return Right(randomRemoteQuote);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      try{
        final randomCacheQuote= await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(randomCacheQuote);
      } on CacheException{
        return Left(CacheFailure());
      }
    }  }
}