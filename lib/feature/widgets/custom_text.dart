import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

class CustomeMedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? size;
  final bool? padding;  
  
  const CustomeMedText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.size,
    this.padding,
   });

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
          text,
          style: style?? Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: size?? 10.sp,
            color:color?? Colors.white,            
          )
        );
      if(padding==true){
        content = Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 10),
          child:content);
      } 
      return content;     
  }
}