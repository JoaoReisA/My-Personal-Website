import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/home/widget/show_avatars.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AvatarWidget(),
          Text(
            Strings.introduction,
            style: GoogleFonts.montserrat()
                .copyWith(fontWeight: FontWeight.bold, fontSize: 65),
          ),
          Text(
            Strings.whatIdo,
            style: GoogleFonts.montserrat()
                .copyWith(color: Colors.grey[700], fontSize: 20),
          ),
        ],
      )),
    );
  }
}
