import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

class CustomeText extends StatelessWidget {
  final String text;
  const CustomeText({
    super.key,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 10),
      child: 
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 3.sp,
            color: Colors.white
          )
        ),
    );
  }
}