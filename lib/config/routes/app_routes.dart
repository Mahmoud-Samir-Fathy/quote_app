import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/features/splash/presentation/screens/splash_screen.dart';
import 'package:quote/injection_container.dart'as di;
import '../../features/random_quote/presentation/cubit/random_quote_cubit.dart';
import '../../features/random_quote/presentation/screens/quote_screen.dart';

class Routes{
  static const String initialRoute='/';
  static const String randomQuoteScreen='/randomQuoteScreen';
}

class AppRoutes{

  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),);

      case Routes.randomQuoteScreen:
        return MaterialPageRoute(builder: (context) => BlocProvider(
            create: (context) =>di.sl<RandomQuoteCubit>() ,
            child: const QuoteScreen()),);



      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen()); // or any other fallback screen
    }

  }
}