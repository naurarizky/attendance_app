import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    leading: IconButton(
      icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        "Attendance Menu",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
  );
}