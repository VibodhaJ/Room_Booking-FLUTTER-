import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final Room_details = FirebaseAuth.instance.currentUser!;

  //document IDs

  List<String> docIDs = [];

  //get docIDs

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Room_details')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              child: Text("New",
                  style: GoogleFonts.itim(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  )),
            ),
            Tab(
              child: Text("Past",
                  style: GoogleFonts.itim(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  )),
            ),
            Tab(
              child: Text("Canceled",
                  style: GoogleFonts.itim(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  )),
            ),
          ]),
          title: Text("BOOKING",
              style: GoogleFonts.itim(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 28,
              )),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          New(),
          Past(),
          Cancelled(),
        ]),
      ),
    );
  }
}

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5)),
        SizedBox(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Image.asset(
                      "assets/room/vip_room2.jpeg",
                      fit: BoxFit.fill,
                    ),
                    width: 160,
                    height: 200,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        "VIP Room",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 86, 92),
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "xxxxxxxx per Night",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 34, 34, 34),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Text(
                        "Check in : 2023-07-24",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 35, 35, 35),
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Check in : 2023-07-26",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 34, 34, 34),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Order ID : 5485624",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 33, 33, 33),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      MaterialButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        onPressed: () {
                          Cancelled();
                        },
                        height: 10,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        elevation: 0,
                        child: Text(
                          "Cancel Booking",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      MaterialButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        onPressed: () {
                          // msg box ekai rate karannai hadanna
                        },
                        height: 10,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        elevation: 0,
                        child: Text(
                          "Rate and review",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          width: 180,
          height: 280,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
      ],
    );
  }
}

class Past extends StatefulWidget {
  const Past({super.key});

  @override
  State<Past> createState() => _PastState();
}

class _PastState extends State<Past> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("thank u"),
    );
  }
}

class Cancelled extends StatefulWidget {
  const Cancelled({super.key});

  @override
  State<Cancelled> createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("fuck u"),
    );
  }
}
