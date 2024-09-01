import 'package:dartz/dartz.dart';
import 'package:quote/core/error/failures.dart';
import 'package:quote/core/usecases/usecase.dart';
import 'package:quote/features/random_quote/domain/entities/quote.dart';
import '../repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote,NoParams>{
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failures, Quote>>? call(NoParams params) => quoteRepository.getRandomQuoteRepository();

}