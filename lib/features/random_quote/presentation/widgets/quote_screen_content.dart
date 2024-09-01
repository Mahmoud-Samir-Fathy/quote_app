import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/quote.dart';

class QuoteScreenContent extends StatelessWidget {
  final Quote quote;
  const QuoteScreenContent({super.key, required this.quote});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.quoteContainerContentColor,
          borderRadius: BorderRadius.circular(20)

      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      child:Column(
        children: [
          Text(quote.content,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Text(quote.author,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,)),

        ],
      ) ,
    );
  }
}
