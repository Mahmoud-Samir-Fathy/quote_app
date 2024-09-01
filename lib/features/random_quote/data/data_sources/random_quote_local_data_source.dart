import 'dart:convert';

import 'package:quote/core/error/exceptions.dart';
import 'package:quote/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/quote_model.dart';

abstract class RandomQuoteLocalDataSource{
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource{
  final SharedPreferences sharedPreferences;
  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString=sharedPreferences.getString(AppStrings.cachedQuoteString);
    if(jsonString!=null){
      final cachedQuoteString=Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachedQuoteString;
    }else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote)  {
    return sharedPreferences.setString(AppStrings.cachedQuoteString, jsonEncode(quote));

  }
}