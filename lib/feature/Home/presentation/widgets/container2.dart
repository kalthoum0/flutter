import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

import '../../../widgets/custome_samll_text.dart';

class Container2 extends StatelessWidget {
  final Widget icon;
  final String text;

  
  const Container2({
    required this.text,
    required this.icon,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(0.3.wp),
          child: Container(
            width: 5.5.wp,
            height: 10.hp,      
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(1.wp),
              color: Color(0xFFEDEFF5),
            ) ,
            child: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),         
          ),
        ),
         CustomeText(
            text: text,
          )
      ],
    );
  }
}