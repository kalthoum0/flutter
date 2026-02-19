import 'package:flutter/material.dart';

class CardSettings{
  final IconData icon;
  final String label;
  final VoidCallback onTap;


  CardSettings({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}