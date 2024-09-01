import 'package:dartz/dartz.dart';
import 'package:quote/core/error/failures.dart';
import '../entities/quote.dart';

abstract class QuoteRepository{
  Future<Either<Failures,Quote>> getRandomQuoteRepository();
}