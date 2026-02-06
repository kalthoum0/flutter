import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screentasia/screentasia.dart';

class Customtextfeild extends StatelessWidget {  

  final TextEditingController  controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final String? hintText;
 


  const Customtextfeild({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.obscureText = false,
    this.inputFormatters,
    this.prefixIcon,
    this.textDirection,
    this.validator,    
    this.hintText
 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(      
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
      style: Theme.of(context).textTheme.titleSmall ,      
      textDirection: textDirection,
      decoration: InputDecoration( 
      hintText:hintText ,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 2.sp),
      errorStyle: TextStyle(
        color: Theme.of(context).colorScheme.error,
        fontSize: 5.sp,
        height: 1.2, ),         
        prefixIcon: prefixIcon,          
        fillColor:Color.fromARGB(255, 245, 244, 244),
        filled: true,        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none//Hides the border 
        ),                                        
      ),
    );
  }
}

