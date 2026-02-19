import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:screentasia/screentasia.dart';

class FreezeUnfreezeDialog extends StatelessWidget {
  final String message;

  const FreezeUnfreezeDialog({
    
    required this.message,
    super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CustomeText(text: message,
            themeStyle: theme.textTheme.titleMedium,),
          ),
         
          SizedBox(height: 1.hp,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: [              
                OutlinedButton(
                  onPressed: () {                 
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide( 
                      color:theme.colorScheme.primary, // border color
                      width:0.1.wp,
                    )
                  ),
                  child: CustomeText(
                    text: 'تم',
                    color: theme.colorScheme.primary,
                    themeStyle: theme.textTheme.titleMedium,
                  ),               
                ),
                OutlinedButton(
                  onPressed: () {                 
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide( 
                      color:theme.colorScheme.error, // border color
                      width:0.1.wp,
                    )
                  ),
                  child: CustomeText(
                    text: 'الغاء',
                    color: theme.colorScheme.error,
                    themeStyle: theme.textTheme.titleMedium,
                  ),               
                ),
            ],
          )
        ],
      ),
    );
  }
}