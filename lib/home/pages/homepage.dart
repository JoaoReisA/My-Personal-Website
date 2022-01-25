import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_website/config/images_path.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(TextSpan(
          text: Strings.firstName,
          style: GoogleFonts.dosis(color: Colors.purple),
          children: [
            TextSpan(
                text: Strings.middleName,
                style: GoogleFonts.dosis(color: Colors.purple)
                    .copyWith(fontWeight: FontWeight.bold))
          ],
        )),
        actions: [
          TextButton(onPressed: () {}, child: const Text("Home")),
          TextButton(onPressed: () {}, child: const Text("Projects")),
          TextButton(onPressed: () {}, child: const Text("About me")),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AvatarWidget(),
          Text(Strings.introduction),
          Text(Strings.whatIdo),
        ],
      )),
    );
  }
}
