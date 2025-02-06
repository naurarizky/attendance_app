import 'package:attendace_app/services/location_services.dart';
import 'package:attendace_app/ui/attend/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          elevation: 5,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
            ],
          ),
        ),
      ),
    );
  }
}