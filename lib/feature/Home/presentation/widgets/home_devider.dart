import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

import '../../../widgets/custome_samll_text.dart';

class HomeDevider extends StatelessWidget {
  final Widget icon;
  final String  text;
  final bool useContainer;
  final String? containerText;  
  final Color? containerColor;
  final Color? borderColor;
  final Widget? containerIcon;

  const HomeDevider({
    super.key,
    required this.icon,
    required this.text,
    this.useContainer = false,
    this.containerText,
    this.containerColor,
    this.borderColor,
    this.containerIcon
    });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Row(
      //mainAxisSize: MainAxisSize.min,
                  children: [
                    icon,                
                    Padding(
                      padding:  EdgeInsets.only(left: 0.2.wp, right: 0.2.wp),
                      child: CustomeText(                    
                        text: text,        
                        size: 14,                
                        themeStyle: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(width: 0.1.wp,),
                  if(useContainer)
                    Container(
                      // height: 3.hp,
                      padding: EdgeInsets.all(0.3.wp),
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(2.wp),
                        border: Border.all( 
                          color: borderColor?? Colors.transparent,
                          width: 0.01.wp                        
                        )
                      ),
                      child: Row(
                        children: [
                          CustomeText(
                            text: containerText?? '',                     
                            size: 3.sp,
                            themeStyle: theme.textTheme.titleMedium,
                            color:borderColor,),

                          if (containerIcon != null) ...[
                            SizedBox(width: 0.4.wp), // optional spacing
                            containerIcon!,
                          ],
                        ],
                      )
                    )
                  ],
                );
    
  }
}