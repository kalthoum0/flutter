import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:screentasia/screentasia.dart';

class GeneralContainer extends StatelessWidget {
   final Widget icon;
  const GeneralContainer({
    required this.icon,
    super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(        
        height: 10.hp,
        decoration: BoxDecoration(
           boxShadow: [
               BoxShadow(
                 color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
                  blurRadius: 4, 
                  spreadRadius: 0, 
                  offset: const Offset(2, 2),// x and y offset
                ),
            ],
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(1.wp)
        ),
      
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                  color: Color(0xFFEDEFF5),
                  borderRadius: BorderRadius.circular(0.5.wp)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:icon,
                ),
              ),
            ),
      
          CustomeText(text:'transaction')
          ],
        ),
      ),
    );
  }
}