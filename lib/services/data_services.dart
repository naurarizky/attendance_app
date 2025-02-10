import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  Future<QuerySnapshot>getData() {
    return dataCollection.get();
  }

  Future<void> deleteData(String docID){
    return dataCollection.doc(docID).delete();
  }
}