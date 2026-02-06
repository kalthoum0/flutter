import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:screentasia/screentasia.dart';

class TransferContainer extends StatelessWidget {
  final Widget icon;
  final String label;
  final String? description;
  const TransferContainer({
    super.key,
    required this.icon,
    required this.label,
    this.description});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(      
      onTap: (){},
      child: Padding(
        padding:  EdgeInsets.all(0.2.wp),
        child: Container(
          height: 17.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.wp),
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
          child: Column(
             children: [
              icon,
              CustomeText(
                text: label,
                themeStyle: theme.textTheme.titleMedium,
                color: Colors.black,
                size: 4.sp,),
              if(description != null)
              CustomeText(
                text: description?? '',
                themeStyle: theme.textTheme.bodySmall,
                color: theme.colorScheme.primary
               )
             ],
          ),
        ),
      ),
    );
  }
}