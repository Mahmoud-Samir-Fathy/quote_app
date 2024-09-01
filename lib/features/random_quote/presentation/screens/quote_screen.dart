import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quote/config/locale/app_localizations.dart';
import 'package:quote/features/splash/presentation/cubit/local_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/random_quote_cubit.dart';
import '../cubit/random_quote_state.dart';
import '../widgets/quote_screen_content.dart';
import 'package:quote/core/utils/widget/error_widget.dart' as error_widget;


class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }
  _getRandomQuote()  =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: AppBar(
            leading:IconButton(icon: const Icon(Icons.translate_outlined),onPressed: (){
              if(AppLocalizations.of(context)!.isEnLocale){
                BlocProvider.of<LocalCubit>(context).toArabic();
              }
              else{
                BlocProvider.of<LocalCubit>(context).toEnglish();
              }

            },)
            ,title: Text(AppLocalizations.of(context)!.translate('app_name')!)),
        body: BlocBuilder<RandomQuoteCubit, RandomQuoteStates>(
          builder: (context, state) {
            if (state is RandomQuoteLoading) {
              return SpinKitFadingCircle(
                color: AppColors.primary,
              );
            } else if (state is RandomQuoteError) {
              return  error_widget.ErrorWidget(
                onPress: () => _getRandomQuote(),
              );

            } else if (state is RandomQuoteIsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    QuoteScreenContent(quote: state.quote),
                    InkWell(
                      onTap: () {
                        _getRandomQuote();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.quoteContainerContentColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.refresh,
                          color: AppColors.quoteIconColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: SpinKitFadingCircle(
                  color: AppColors.primary,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
