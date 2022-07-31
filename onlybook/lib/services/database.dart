import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference Usercollection =
      FirebaseFirestore.instance.collection('users');

  Future updateEmail(String Name) async {
    return await Usercollection.doc(uid).set({
      'Email': Name,
    }, SetOptions(merge: true));
  }

  Future updatePassword(String Name) async {
    return await Usercollection.doc(uid).set({
      'Password': Name,
    }, SetOptions(merge: true));
  }

  Future updateFirstName(String firstname) async {
    return await Usercollection.doc(uid).set({
      'FirstName': firstname,
    }, SetOptions(merge: true));
  }

  Future updateLastName(String lastname) async {
    return await Usercollection.doc(uid).set({
      'LastName': lastname,
    }, SetOptions(merge: true));
  }

  Future updateBranch(String Branch) async {
    return await Usercollection.doc(uid).set({
      'Branch': Branch,
    }, SetOptions(merge: true));
  }

  Future updateYear(String year) async {
    return await Usercollection.doc(uid).set({
      'Year': year,
    }, SetOptions(merge: true));
  }

  Future updatePhoneNumber(String number) async {
    return await Usercollection.doc(uid).set({
      'PhoneNumber': number,
    }, SetOptions(merge: true));
  }

  Future deleteItem(
      {required String itemname, required String category}) async {
    await FirebaseFirestore.instance
        .collection('books3')
        .doc(category)
        .update({itemname: FieldValue.delete()});
  }

  // Future<String> getName() async {
  //   DocumentReference documentReference = Usercollection.doc(uid);
  //   String name="";
  //   await documentReference.get().then((snapshot) {
  //     name = snapshot.data().toString();
  //   });
  //   return name;
  // }

}
