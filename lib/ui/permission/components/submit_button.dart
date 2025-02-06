import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Size size;
  final TextEditingController nameController;
  final TextEditingController formController;
  final TextEditingController toController;
  final String dropValueCategories;
  final CollectionReference dataCollection;


  const SubmitButton({
    super.key, 
    required this.size, 
    required this.nameController, 
    required this.formController, 
    required this.toController, 
    required this.dropValueCategories, 
    required this.dataCollection});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}