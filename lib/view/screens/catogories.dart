import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roombooking/view/screens/details.dart';
import 'package:roombooking/view/screens/watchlist.dart';

class Catogories extends StatelessWidget {
  const Catogories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ROOMS",
            style: GoogleFonts.itim(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 28,
            )),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
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
                      width: 150,
                      height: 180,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 05, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VIP Room",
                          style: GoogleFonts.itim(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 174, 9, 89),
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Room",
                          style: GoogleFonts.itim(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 34, 34, 34),
                            fontSize: 16,
                          ),
                        ),

                        Text(
                          "xxxxxxxx per Night",
                          style: GoogleFonts.itim(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 35, 35, 35),
                            fontSize: 21,
                          ),
                        ),
                        //stars here
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 34),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WatchList()));
                          },
                          height: 10,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          elevation: 0,
                          child: Text(
                            "Add to watchlist",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        MaterialButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemDetails()));
                          },
                          height: 10,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          elevation: 0,
                          child: Text(
                            "More Details",
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
              color: Color.fromARGB(158, 213, 200, 200),
            ),
            width: 220,
            height: 240,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
        ],
      ),
    );
  }
}
