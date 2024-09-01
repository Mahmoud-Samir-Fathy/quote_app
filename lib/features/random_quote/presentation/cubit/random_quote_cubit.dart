import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/core/usecases/usecase.dart';
import 'package:quote/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:quote/features/random_quote/presentation/cubit/random_quote_state.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/quote.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteStates>{
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase}) : super(RandomQuoteInitial());


Future<void> getRandomQuote() async{
  emit(RandomQuoteLoading());
 Either<Failures, Quote> ? response= await getRandomQuoteUseCase(NoParams());

 emit (response!.fold(
         (failure)=>RandomQuoteError(msg: _msgFailureToMsg(failure)),
         (quote)=>RandomQuoteIsLoaded(quote: quote),
 ));

}
  String _msgFailureToMsg(Failures failure){
    switch (failure.runtimeType){
      case const (ServerFailure):
        return AppStrings.serverFailure;
      case const (CacheFailure):
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unExpectedError;
    }
  }
}