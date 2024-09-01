import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/core/error/failures.dart';
import 'package:quote/core/usecases/usecase.dart';
import 'package:quote/core/utils/app_strings.dart';
import 'package:quote/features/splash/domain/use_cases/get_saved_lang.dart';
import 'package:quote/features/splash/presentation/cubit/local_state.dart';

import '../../domain/use_cases/change_lang.dart';

class LocalCubit extends Cubit<LocalState>{
  final ChangeLangUseCase changeLangUseCase;
  final GetSavedLangUseCase getSavedLangUseCase;
  LocalCubit({required this.changeLangUseCase,required this.getSavedLangUseCase}):super(ChangeLocalState(Locale (AppStrings.englishCode)));

  String currentLanguage=AppStrings.englishCode;


  Future<void> saveLang() async{

    final response=await getSavedLangUseCase.call(NoParams());
    response.fold((failure)=>debugPrint(AppStrings.cacheFailure), (value){
      currentLanguage=value!;
      emit(ChangeLocalState(Locale(currentLanguage)));
    });
  }

  Future<void> changeLang(String langCode) async{
    final response= await changeLangUseCase.call(langCode);
    response!.fold((failure)=>
        debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguage=langCode;
      emit(ChangeLocalState(Locale(currentLanguage)));
    }
    );
  }
  void toEnglish()=>changeLang(AppStrings.englishCode);
  void toArabic()=>changeLang(AppStrings.arabicCode);
}