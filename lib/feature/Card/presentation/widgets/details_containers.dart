import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/Card/data/Mapper/card_settings_class.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:screentasia/screentasia.dart';

class CardContainer extends StatelessWidget {
  final String label; 
  final String data;
  final Widget? icon;
  final Color? color;


  const CardContainer({
    required this.label,
    required this.data,
    this.icon,
    this.color,
    super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
       
        padding: EdgeInsets.all(1.wp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.wp),
          border: Border.all(
            color: theme.colorScheme.outline,
            width: 0.1.wp
          )
        ),
        child: Row(
         
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CustomeText(
                text: label,
                themeStyle: theme.textTheme.titleMedium,
                size: 12,
              ),
              SizedBox(height: 0.4.hp,),
              CustomeText(
                text: data,
                themeStyle: theme.textTheme.titleLarge,
               size: 16,
                color: color,)
            ],),                
          ),
          if (icon == null)...[
             SizedBox(
              width: 5.wp
             )
          ],
          if (icon != null)...[
           icon!
          ]
      
        ],)
      ),
    );
  }
}