import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:shopify/models/constant.dart';

class Books {
  final String title;
  final String price;
  final String course;
  final String imgPath;
  final String branch;
  final String year;
  final String author;
  final String seller;
  final String bookid;

  //final int id;

  Books(
      {required this.title,
      required this.price,
      required this.course,
      required this.imgPath,
      required this.author,
      required this.branch,
      required this.year,
      required this.bookid,
      //required this.semester,
      required this.seller});
  // Map<String, dynamic> toJson() => {

  // }
  static Books fromJson(Map<String, dynamic> json, String id) => Books(
      title: json['Title'],
      price: json['Price'],
      course: json['Course'],
      imgPath: json['imgpath'],
      branch: json['Branch'],
      year: json['Year'],
      author: json['Author'],
      seller: json['Sellername'],
      bookid: id);

  Stream<List<Books>> readBooks() => FirebaseFirestore.instance
      .collection('books')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Books.fromJson(doc.data(), doc.id))
          .toList());
}
