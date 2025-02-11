import 'package:attendace_app/services/data_services.dart';
import 'package:attendace_app/ui/history/attendance_card.dart';
import 'package:attendace_app/ui/history/delete_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class __AttendanceHistoryScreenState extends StatefulWidget {
  const __AttendanceHistoryScreenState({super.key});

  @override
  State<__AttendanceHistoryScreenState> createState() => ___AttendanceHistoryScreenStateState();
}

class ___AttendanceHistoryScreenStateState extends State<__AttendanceHistoryScreenState> {
  final DataServices dataServices = DataServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance History"),
      ),
      body: StreamBuilder(
        stream: dataServices.dataCollection.snapshots(), 
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: Text("There is no data."),
            );
          }

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index){
              return AttendanceHistoryCard(
                data: data[index].data() as Map<String, dynamic>,
                //mendefinisikan data yg akan muncul di UI berdasarkan index/posisi yg ada di db 
                onDelete: (){
                  showDialog(
                    context: context, 
                    builder: (context) => DeleteDialog(
                      documentId: data[index].id, 
                      dataCollection: dataServices.dataCollection,
                      //digunakan untuk memperbarui  state setelah terjadi perhapusan data dari db
                      onConfirm: () {
                        setState(() {
                          dataServices.deleteData(data[index].id);
                          Navigator.pop(context);
                        });
                      },
                      )
                    );
                },
                );
            },
          );
        }
        ),
    );
  }
}