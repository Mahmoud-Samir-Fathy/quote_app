import 'package:dartz/dartz.dart';
import 'package:quote/core/error/failures.dart';
import 'package:quote/core/usecases/usecase.dart';

import '../repositories/lang_repository.dart';

class GetSavedLangUseCase implements UseCase<String?,NoParams>{
  final LangRepository langRepository;
  GetSavedLangUseCase({required this.langRepository});
  @override
  Future<Either<Failures, String?>> call(NoParams params) async=>
      await langRepository.savedLocale();
}