import 'package:flutter/material.dart';
import 'package:onlybook/Screens/detailsForm.dart';
// import 'package:flutter_auth/constants.dart';
// import 'package:flutter_auth/responsive.dart';
import 'package:onlybook/constants.dart';
import 'package:onlybook/responsive.dart';
import '../../components/background.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: ht,
        width: wt,
        child: Stack(
          children: [
            Container(
              //color:Colors.transparent,
              height: ht,
              width: wt,
              child: Image.asset('assets/bg2.jpeg', fit: BoxFit.cover),
            ),
            Container(
              color: Colors.grey.shade200.withOpacity(0.4),
              height: ht,
              width: wt,
            ),
            Center(
                child: Container(
              height: ht * 0.6,
              width: wt * 0.87,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFb993d6).withOpacity(0.8),
                      Color(0XFF8ca6db).withOpacity(0.8),
                      // Color(0XFFffffff)
                    ],
                  )),
              child: DetailsForm(),
            ))
          ],
        ),
      ),
    );
  }
}
