import 'package:quote/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataSource {
  Future< bool> changeLocale({required String langCode});
  Future<String?> savedLocale();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;
  LangLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> changeLocale({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.local, langCode);

  @override
  Future<String?> savedLocale() async =>

      sharedPreferences.containsKey(AppStrings.local)?
          sharedPreferences.getString(AppStrings.local):
          AppStrings.englishCode;
  }

