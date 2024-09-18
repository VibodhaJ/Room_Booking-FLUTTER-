import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roombooking/view/screens/login.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final user = FirebaseAuth.instance.currentUser!;
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildTop(),
        buildContent(),
        colorTiles(),
        logout(),
      ],
    ));
  }

  Widget cover() => Container(
        color: Color.fromARGB(255, 4, 91, 102),
        width: double.infinity,
        height: coverHeight,
      );
  Widget profilePic() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/profile.jpeg'),
      );
  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: cover(),
        ),
        Positioned(
          child: profilePic(),
          top: top,
        ),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            "Vibodha Jayasinghe",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "abc@gmail.com",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      );

  Widget colorTiles() {
    return Column(
      children: [
        colortile(
            Icons.person, Color.fromARGB(255, 5, 112, 85), "Edit Profile"),
        colortile(Icons.discount_outlined,
            const Color.fromARGB(255, 5, 112, 85), "Discount Voucher"),
        colortile(Icons.support_agent, const Color.fromARGB(255, 5, 112, 85),
            "Support"),
        colortile(
            Icons.settings, const Color.fromARGB(255, 5, 112, 85), "Settings"),
      ],
    );
  }

  Widget colortile(IconData icon, Color color, String text) {
    return ListTile(
        leading: Container(
            child: Icon(icon, color: color),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color.fromARGB(255, 250, 250, 250))),
        title: Text(
          text,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: const Color.fromARGB(255, 51, 51, 51),
          size: 22,
        ));
  }

  Widget logout() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Login(),
        //   ),
        // );
        FirebaseAuth.instance.signOut();
      },
      child: Container(
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 18)),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Icon(
                Icons.logout_rounded,
                size: 30,
                color: const Color.fromARGB(255, 134, 20, 12),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15)),
            Text(
              "LOGOUT",
              style: TextStyle(
                  color: const Color.fromARGB(255, 131, 11, 2),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
