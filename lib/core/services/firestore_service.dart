import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data , String? uid}) async {
    if(uid !=null)
      {
        await fireStore.collection(path).doc(uid).set(data);
      }
    else
      {
        await fireStore.collection(path).add(data);
      }

  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    var userData = await fireStore.collection(path).doc(documentId).get();
    return userData.data() as Map<String, dynamic>;  // map<String , dynamic>
  }

  @override
  Future<bool> checkIfDataExist({required String path, required String documentId})async {
   var data = await fireStore.collection(path).doc(documentId).get();
   return data.exists;
  }


}
