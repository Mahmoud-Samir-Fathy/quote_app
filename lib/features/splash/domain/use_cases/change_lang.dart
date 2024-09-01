import 'package:dartz/dartz.dart';
import 'package:quote/core/error/failures.dart';
import 'package:quote/features/splash/domain/repositories/lang_repository.dart';
import '../../../../core/usecases/usecase.dart';

class ChangeLangUseCase implements UseCase<bool,String>{
  final LangRepository langRepository;
  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failures, bool>>? call(String langCode) async=>await langRepository.changeLocale(langCode:langCode);
}