import 'package:dartz/dartz.dart';
import 'package:quote/core/error/exceptions.dart';
import 'package:quote/core/error/failures.dart';
import 'package:quote/features/splash/data/data_sources/lang_local_data_source.dart';
import 'package:quote/features/splash/domain/repositories/lang_repository.dart';

class LangRepositoryImpl implements LangRepository{
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failures, bool>> changeLocale({required String langCode}) async{
    try{
      final langIsChanged= await langLocalDataSource.changeLocale(langCode: langCode);
      return Right(langIsChanged);

    }on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failures, String?>> savedLocale() async{
    try{
      final langCode= await langLocalDataSource.savedLocale();
      return Right(langCode);

    }on CacheException{
      return Left(CacheFailure());
    }  }
}