// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roombooking/view/screens/details.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch List",
            style: GoogleFonts.itim(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 28,
            )),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5)),
          SizedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                      height: 150,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 05, horizontal: 10),
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
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 14),
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
                                  "Book Now",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: MaterialButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  onPressed: () {},
                                  height: 10,
                                  color: Color.fromARGB(82, 175, 29, 29),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  elevation: 0,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Icon(
                                      Icons.delete,
                                      color:
                                          const Color.fromARGB(255, 119, 16, 9),
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              color: Color.fromARGB(158, 213, 200, 200),
            ),
            width: 210,
            height: 190,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
        ],
      ),
    );
  }
}
