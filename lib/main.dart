import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/app.dart';
import 'bloc_observer.dart';
import 'injection_container.dart'as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();
  runApp(const QuoteApp());
}

