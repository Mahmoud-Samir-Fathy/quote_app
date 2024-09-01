import 'package:dartz/dartz.dart';
import 'package:quote/core/error/failures.dart';

abstract class LangRepository{
  Future<Either<Failures,bool>> changeLocale({required String langCode});
  Future<Either<Failures,String?>> savedLocale();
}