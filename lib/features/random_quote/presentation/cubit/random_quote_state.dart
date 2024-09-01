import 'package:equatable/equatable.dart';
import 'package:quote/features/random_quote/domain/entities/quote.dart';

abstract class RandomQuoteStates extends Equatable{
  const RandomQuoteStates();

  @override
  List<Object> get props=>[];
}


class RandomQuoteInitial extends RandomQuoteStates{}

class RandomQuoteLoading extends RandomQuoteStates{}


class RandomQuoteIsLoaded extends RandomQuoteStates{
final Quote quote;
  const RandomQuoteIsLoaded({required this.quote});
@override
List<Object> get props=>[quote];
}

class RandomQuoteError extends RandomQuoteStates{
  final String msg;
  const RandomQuoteError({required this.msg});
  @override
  List<Object> get props=>[msg];
}