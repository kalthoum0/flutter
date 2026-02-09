import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final Widget? child;
  final VoidCallback onPressed;
  final Color? color;

  const Custombutton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,      
      style:ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color)
      ),     
      child: child,            
    );
  }
}