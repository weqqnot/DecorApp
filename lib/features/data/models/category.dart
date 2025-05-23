import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final String iconPath;
  final Widget destinationPage;

  const Category({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.destinationPage,
  });
}
