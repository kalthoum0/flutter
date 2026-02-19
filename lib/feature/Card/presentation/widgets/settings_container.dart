import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:screentasia/screentasia.dart';

class SettingsContainer extends StatelessWidget {
  final IconData icon;
  final String derscription;
  const SettingsContainer({
    required this.icon,
    required this.derscription,
    super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(1.wp),
        boxShadow: [
               BoxShadow(
                 color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
                  blurRadius: 4, 
                  spreadRadius: 0, 
                  offset: const Offset(2, 2),// x and y offset
                ),
            ] 
        ),
      child: Padding(
        padding:  EdgeInsets.all(1.wp),
        child: Column(
          children: [
            Icon(icon,
            color: theme.colorScheme.primary ,),
        
            SizedBox(height: 1.hp,),
        
            CustomeText(
              text: derscription,
              themeStyle: theme.textTheme.titleMedium,
              color: theme.colorScheme.primary,)
          ],
        ),
      ),
    );
  }
}