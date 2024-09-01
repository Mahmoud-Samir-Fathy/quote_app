import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailure extends  Failures{}
class CacheFailure extends Failures{}