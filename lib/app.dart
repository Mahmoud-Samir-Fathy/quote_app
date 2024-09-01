import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/config/locale/app_localizations_setup.dart';
import 'package:quote/config/routes/app_routes.dart';
import 'package:quote/config/themes/app_theme.dart';
import 'package:quote/features/splash/presentation/cubit/local_cubit.dart';
import 'package:quote/features/splash/presentation/cubit/local_state.dart';
import 'injection_container.dart'as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>di.sl<LocalCubit>()..getSavedLangUseCase)
      ],
      child: BlocBuilder<LocalCubit,LocalState>(
        buildWhen: (previousState,currentState) {
          return previousState!=currentState;},
        builder: (context, state) {
          return MaterialApp(
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
            );
        },
      )
    );
  }
}

