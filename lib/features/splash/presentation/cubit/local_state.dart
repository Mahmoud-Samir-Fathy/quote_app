import 'dart:ui';

import 'package:equatable/equatable.dart';


abstract class LocalState extends Equatable{
  final Locale locale;

  const LocalState(this.locale);
  @override
  List<Object?> get props => [locale];
  }

class ChangeLocalState extends LocalState{
  const ChangeLocalState(super.selectedLocale);
}