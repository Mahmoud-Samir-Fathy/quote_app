import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quote/config/routes/app_routes.dart';
import 'package:quote/core/utils/assets_manager.dart';
import 'package:quote/features/random_quote/presentation/screens/quote_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _goNext()=>Navigator.pushReplacementNamed(context, Routes.randomQuoteScreen);
  late Timer _timer;
  _startDelay(){
    _timer=Timer(Duration(milliseconds: 2000), ()=>_goNext());
  }
  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImgAssets.splash)

      ),
    );
  }
}
