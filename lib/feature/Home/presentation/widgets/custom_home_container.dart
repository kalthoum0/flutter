import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/custome_samll_text.dart';

class CustomHomeContainer extends StatelessWidget {
  final Widget icon;
  final String label;

  const CustomHomeContainer({
    required this.icon,
    required this.label,
    super.key});  
  @override
  

  Widget build(BuildContext context) {    
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: (){

      },      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(  
          // margin: EdgeInsets.only(top:0.5.wp, bottom: 0.5.wp ),    
          // width: 15.wp,
          height: 10.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.5.wp),
            color: theme.colorScheme.background,
            boxShadow: [
               BoxShadow(
                 color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
                  blurRadius: 4, 
                  spreadRadius: 0, 
                  offset: const Offset(2, 2),// x and y offset
                ),
            ]
          ),     
          padding: EdgeInsets.all(4),      
          child: Column(
            children: [
              icon,
              CustomeText(text: label,
              themeStyle: theme.textTheme.titleMedium,                      
               ),
              Expanded(
                child: Container( 
                  width: 3.wp,
                  height: 0.5.hp,   
                  margin: EdgeInsets.only(top: 1.hp),          
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: theme.colorScheme.primary,)
                ),
              )
            ],
          ),
          
        ),
      ),
    );
  }
}