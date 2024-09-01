import 'package:quote/core/api/api_consumer.dart';
import 'package:quote/core/api/endpoints.dart';

import '../models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRemoteRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource{
  ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<QuoteModel> getRemoteRandomQuote() async {
    final response=await apiConsumer.get(EndPoints.randomQuote);
    return QuoteModel.fromJson(response);

  }
}