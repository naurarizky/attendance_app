import 'dart:io';

import 'package:attendace_app/services/location_services.dart';
import 'package:attendace_app/services/timestamp_services.dart';
import 'package:attendace_app/ui/attend/camera_screen.dart';
import 'package:attendace_app/ui/attend/components/app_bar.dart';
import 'package:attendace_app/ui/attend/components/capture_photo.dart.dart';
import 'package:attendace_app/ui/attend/components/header.dart';
import 'package:attendace_app/ui/attend/components/location.dart';
import 'package:attendace_app/ui/attend/components/name_input.dart';
import 'package:attendace_app/ui/attend/components/submit_%20button.dart';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final XFile? image;
  
  const AttendanceScreen({super.key, required this.image});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState(this.image);
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  _AttendanceScreenState(this.image);

  XFile? image;
  String addressPlaceholder = "", datePlaceholder = "", timePlaceholder = "", timeStampPlaceholder = "", statusPlaceholder = "Attend";
  bool isLoading = false;
  // double lat = 0.0, long = 0.0;
  // int dateHours = 0, minuite = 0;
  final controllerName = TextEditingController();
  // final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendace');

  @override
  void initState() {
    super.initState();
    handleLocationPermission(context);
    setDateTime((date, time, timeStamp) {
      setState(() {
        datePlaceholder = date;
        timePlaceholder = time; 
        timeStampPlaceholder = timeStamp;
      });
    });
    setAttendedStatus((status){
      setState(() {
        statusPlaceholder = status;
      });
    });

    if(image != null){
      isLoading = true;
      getGeoLocationPosition(context, (position) {
        setState(() {
          isLoading = false;
          getAddressFromLongLat(position, (address){
            setState(() {
              addressPlaceholder = address;
            });
          });
        });
      });
    }
  }


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
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              buildCapturePhotoSection(context, size, image),
              buildNameInputField(controllerName),
              buildLocationSection(isLoading, addressPlaceholder),
              buildSubmitButton(context, size, image, controllerName, addressPlaceholder, statusPlaceholder, timePlaceholder)
            ],
          ),
        ),
      ),
    );
  } 
  }