import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';



class CustomeText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final bool? padding;
  final TextStyle? themeStyle;
  
  const CustomeText({
    super.key,
    required this.text,  
    this.color,
    this.size,
    this.padding,
    this.themeStyle
   });   
  @override
  Widget build(BuildContext context) {

    ThemeData theme = Theme.of(context);
    Widget content = Text(
          text,
          style: (themeStyle?? theme.textTheme.bodySmall)?.copyWith(
          fontSize:
          size?? 3.sp,
          
          // 11.sp.ap(adaptivePercentage:
          //         const AdaptivePercentage(
          //           tablet:80,
          //          desktop:60,
          // )),          
          color:color?? Colors.white,            
          ));
         
      if(padding==true){
        content = Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 10),
          child:content);
      } 
      return content;     
  }
}