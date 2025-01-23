import 'dart:io';

import 'package:attendace_app/ui/attend/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final XFile image;
  
  const AttendanceScreen({super.key, required this.image});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState(this.image);
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  _AttendanceScreenState(this.image);

  XFile? image;
  String strAddress = "", date = "", time = "", dateTime = "", status = "Attend";
  bool isLoading = false;
  double lat = 0.0, long = 0.0;
  int dateHours = 0, minuite = 0;
  final controller = TextEditingController();
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendace');

  @override
  void initState() {
    // handleLocationPermission();
    // setDateTime();
    // setAttendedStatus();

    if(image != null){
      isLoading = true;
      // getGeoLocationPosition();
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
          ) ,
          title: const Text(
            "Attendace Report",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5 ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                  ),
                  color: Colors.blue
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 12),
                    Icon(Icons.face_retouching_natural_outlined),
                    SizedBox(width: 12),
                    Text(
                      "Please Scan your Face!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                child: Text(
                  "Capture Image",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push
                    (context, 
                    MaterialPageRoute(builder: (context) => const CameraScreen())
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                    width: size.width,
                    height: 150,
                    child: DottedBorder(
                        radius: Radius.circular(10),
                        borderType: BorderType.RRect,
                        color: Colors.blueAccent,
                        strokeWidth: 1,
                        dashPattern: [5, 5],
                        child: SizedBox.expand(
                          child: FittedBox(
                            child: image != null
                            ? Image.file(File(image!.path),  fit: BoxFit.cover)
                            : Icon(Icons.camera_enhance_outlined)
                            //
                          ),
                        ),
                        )
                      ),
                  ),       
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        labelText: "Your Name",
                        hintText: "Please type ur name here",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blueAccent)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueAccent)
                        )
                      ),
                    ),
                    )      
            ],
          ),
        ),
      ),
    );
  }
}