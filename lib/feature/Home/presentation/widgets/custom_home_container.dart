import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/custome_samll_text.dart';

class CustomHomeContainer extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color? color;
  final bool? blueLine;
  final double? height;
  final bool? border;
  final Color? borderClr;

  const CustomHomeContainer({
    required this.icon,
    required this.label,
    this.color,
    this.blueLine = true,
    this.height,
    this.border = false,
    this.borderClr,
    super.key});  
  @override
  

  Widget build(BuildContext context) {    
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: (){

      },      
      child: Padding(
        padding:  EdgeInsets.all(0.4.wp),
        child: Container(  
          // margin: EdgeInsets.only(top:0.5.wp, bottom: 0.5.wp ),    
          // width: 15.wp,
          // height: height?? 10.hp,
          decoration: BoxDecoration(            
            borderRadius: BorderRadius.circular(1.wp),
            color:color?? Color(0xFFEDEFF5),
            boxShadow: [
               BoxShadow(
                 color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
                  blurRadius: 4, 
                  spreadRadius: 0, 
                  offset: const Offset(2, 2),// x and y offset
                ),
            ],
          
          ),     
         padding: EdgeInsets.all(0.1.wp),      
          child: Column(
            children: [
              icon,
              CustomeText(text: label,
              themeStyle: theme.textTheme.titleMedium,     
              size: 12,                 
               ),
              if(blueLine!)...[
              Container( 
                width: 3.wp,
                height: 0.1.hp,   
                margin: EdgeInsets.only(top: 1.5.hp),          
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: theme.colorScheme.primary,)
              )]
            ],
          ),
          
        ),
      ),
    );
  }
}