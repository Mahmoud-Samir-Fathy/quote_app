import 'package:flutter/material.dart';
import 'package:quote/config/locale/app_localizations.dart';
import 'package:quote/core/utils/media_query.dart';

import '../app_colors.dart';

class ErrorWidget extends StatelessWidget{
  final VoidCallback? onPress;
  const ErrorWidget({super.key, this.onPress});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_outlined,size: 150,color: AppColors.primary,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
                child:  Text(AppLocalizations.of(context)!.translate('something_went_wrong')!,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),)),
            Text(AppLocalizations.of(context)!.translate('try_again')!,style: TextStyle(color:AppColors.hint,fontWeight: FontWeight.w500,fontSize: 18),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 50,
              width: context.width*0.60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: AppColors.primary),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    overlayColor: Theme.of(context).primaryColor,
                    elevation: 500
                  ),
                    onPressed: (){
                      if(onPress!=null){
                        onPress!();
                      }
                    },
                    child:  Text(AppLocalizations.of(context)!.translate('reload_screen')!,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),)))

        ],),
      ),
    );
  }
}