import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          "WELCOME TO ONLY BOOKS",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize:15),
        ),
        SizedBox(height: defaultPadding * 1),
        Row(
          children: [
            Spacer(),
            Expanded(
                flex: 8,
                child: Image(image: AssetImage('assets/onlybookslogo.jpg'))),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
