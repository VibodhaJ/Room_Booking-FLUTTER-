// import 'dart:ui';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart';

// import 'booking_step1.dart';

// class ItemDetails extends StatefulWidget {
//   const ItemDetails({super.key});

//   @override
//   State<ItemDetails> createState() => _ItemDetailsState();
// }

// class _ItemDetailsState extends State<ItemDetails> {
//   final user = FirebaseAuth.instance.currentUser;

//   // Document IDs
//   List<String> docIDs = [];
//   Map<String, dynamic>? roomDetails;

//   // Fetch document IDs
//   Future getDocId() async {
//     await FirebaseFirestore.instance
//         .collection('Room_details')
//         .get()
//         .then((snapshot) => snapshot.docs.forEach((document) {
//               docIDs.add(document.reference.id);
//             }));
//   }

//   // Fetch room details
//   Future getRoomDetails(String docId) async {
//     await FirebaseFirestore.instance
//         .collection('Room_details')
//         .doc(docId)
//         .get()
//         .then((document) {
//       setState(() {
//         roomDetails = document.data();
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getDocId().then((_) {
//       if (docIDs.isNotEmpty) {
//         getRoomDetails(docIDs[0]);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: roomDetails == null
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Stack(
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     child: Image.asset("assets/room/family_room.jpg"),
//                   ),
//                   buttonArrow(),
//                   scroll(),
//                 ],
//               ),
//       ),
//     );
//   }

//   buttonArrow() {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Container(
//           clipBehavior: Clip.hardEdge,
//           height: 55,
//           width: 55,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Container(
//               height: 55,
//               width: 55,
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(25)),
//               child: Icon(
//                 Icons.arrow_back_ios,
//                 size: 20,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   scroll() {
//     return DraggableScrollableSheet(
//         initialChildSize: 0.65,
//         maxChildSize: 1.0,
//         minChildSize: 0.6,
//         builder: (context, ScrollController) {
//           return Container(
//             clipBehavior: Clip.hardEdge,
//             decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(45),
//                   topRight: Radius.circular(45),
//                 )),
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         roomDetails?['name'] ?? 'Loading...',
//                         style: GoogleFonts.itim(
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 0, 0, 0),
//                           fontSize: 32,
//                         ),
//                       ),
//                       Padding(padding: EdgeInsets.only(right: 105)),
//                       Image.asset("assets/heart.png"),
//                     ],
//                   ),
//                   Text(
//                     "${roomDetails?['price'] ?? 'Loading...'} Per Night",
//                     style: GoogleFonts.itim(
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(156, 0, 0, 0),
//                       fontSize: 24,
//                     ),
//                   ),
//                   Container(
//                     child: SizedBox(height: 40),
//                   ),
//                   Text(
//                     "Features",
//                     style: GoogleFonts.itim(
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 174, 9, 89),
//                       fontSize: 24,
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
//                     child: Row(
//                       children: roomDetails?['features'].map<Widget>((feature) {
//                             return Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 15),
//                               margin: EdgeInsets.only(right: 10),
//                               decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 254, 254, 254),
//                                   borderRadius: BorderRadius.circular(40),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         offset: Offset(2.0, 2.0),
//                                         spreadRadius: 1.0,
//                                         color:
//                                             const Color.fromARGB(61, 0, 0, 0))
//                                   ]),
//                               child: Text(
//                                 feature,
//                                 style: GoogleFonts.itim(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 80, 80, 80),
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             );
//                           }).toList() ??
//                           [],
//                     ),
//                   ),
//                   Text(
//                     "Guests",
//                     style: GoogleFonts.itim(
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 174, 9, 89),
//                       fontSize: 24,
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding:
//                               EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 254, 254, 254),
//                               borderRadius: BorderRadius.circular(40),
//                               boxShadow: [
//                                 BoxShadow(
//                                     offset: Offset(2.0, 2.0),
//                                     spreadRadius: 1.0,
//                                     color: const Color.fromARGB(61, 0, 0, 0))
//                               ]),
//                           child: Text(
//                             roomDetails?['guests'] ?? 'Loading...',
//                             style: GoogleFonts.itim(
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 80, 80, 80),
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     "Facilities",
//                     style: GoogleFonts.itim(
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 174, 9, 89),
//                       fontSize: 24,
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
//                     child: Row(
//                       children: roomDetails?['facilities']
//                               .map<Widget>((facility) {
//                             return Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 15),
//                               margin: EdgeInsets.only(right: 10),
//                               decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 254, 254, 254),
//                                   borderRadius: BorderRadius.circular(15),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         offset: Offset(2.0, 2.0),
//                                         spreadRadius: 1.0,
//                                         color:
//                                             const Color.fromARGB(61, 0, 0, 0))
//                                   ]),
//                               child: Column(
//                                 children: [
//                                   Icon(
//                                     facility == 'Wi-Fi'
//                                         ? Icons.wifi
//                                         : facility == 'TV'
//                                             ? Icons.tv_rounded
//                                             : Icons.ac_unit,
//                                     size: 28,
//                                     color:
//                                         const Color.fromARGB(255, 9, 63, 108),
//                                   ),
//                                   Text(facility,
//                                       style: GoogleFonts.itim(
//                                         fontWeight: FontWeight.bold,
//                                         color: Color.fromARGB(255, 9, 63, 108),
//                                         fontSize: 14,
//                                       ))
//                                 ],
//                               ),
//                             );
//                           }).toList() ??
//                           [],
//                     ),
//                   ),
//                   Center(
//                     child: MaterialButton(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 7, horizontal: 55),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: ((context) => Booking_step1())));
//                       },
//                       height: 10,
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(35),
//                       ),
//                       elevation: 0,
//                       child: Text(
//                         "Book Now",
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.bold,
//                           color: const Color.fromARGB(255, 255, 255, 255),
//                           fontSize: 28,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
import 'dart:ui';

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'booking_step1.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
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

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/room/family_room.jpg"),
            ),
            buttonArrow(),
            scroll(),
          ],
        ),
      ),
    );
  }

  buttonArrow() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.65,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, ScrollController) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                )),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "Family Rooms",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 32,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 105)),
                      Image.asset("assets/heart.png"),
                    ],
                  ),
                  Text(
                    "xxxxxxxxxx Per Night",
                    style: GoogleFonts.itim(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(156, 0, 0, 0),
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    child: SizedBox(height: 40),
                  ),
                  Text(
                    "Features",
                    style: GoogleFonts.itim(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 174, 9, 89),
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 254, 254),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 1.0,
                                    color: const Color.fromARGB(61, 0, 0, 0))
                              ]),
                          child: Text(
                            "Bathroom",
                            style: GoogleFonts.itim(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 80, 80, 80),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 254, 254),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 1.0,
                                    color: const Color.fromARGB(61, 0, 0, 0))
                              ]),
                          child: Text(
                            "Living Room",
                            style: GoogleFonts.itim(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 80, 80, 80),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 254, 254),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 1.0,
                                    color: const Color.fromARGB(61, 0, 0, 0))
                              ]),
                          child: Text(
                            "Kitchen Room",
                            style: GoogleFonts.itim(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 80, 80, 80),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Guests",
                    style: GoogleFonts.itim(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 174, 9, 89),
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 254, 254),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 1.0,
                                    color: const Color.fromARGB(61, 0, 0, 0))
                              ]),
                          child: Text(
                            "7 Adults",
                            style: GoogleFonts.itim(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 80, 80, 80),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Facilities",
                    style: GoogleFonts.itim(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 174, 9, 89),
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 254, 254),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 1.0,
                                    color: const Color.fromARGB(61, 0, 0, 0))
                              ]),
                          child: Column(
                            children: [
                              Icon(
                                Icons.wifi,
                                size: 28,
                                color: const Color.fromARGB(255, 9, 63, 108),
                              ),
                              Text("Wi-Fi",
                                  style: GoogleFonts.itim(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 9, 63, 108),
                                    fontSize: 14,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 17),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 254, 254),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 1.0,
                                    color: const Color.fromARGB(61, 0, 0, 0))
                              ]),
                          child: Column(
                            children: [
                              Icon(
                                Icons.tv_rounded,
                                size: 28,
                                color: const Color.fromARGB(255, 9, 63, 108),
                              ),
                              Text("TV",
                                  style: GoogleFonts.itim(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 9, 63, 108),
                                    fontSize: 14,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 254, 254),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 1.0,
                                    color: const Color.fromARGB(61, 0, 0, 0))
                              ]),
                          child: Column(
                            children: [
                              Icon(
                                Icons.ac_unit,
                                size: 28,
                                color: const Color.fromARGB(255, 9, 63, 108),
                              ),
                              Text("AC",
                                  style: GoogleFonts.itim(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 9, 63, 108),
                                    fontSize: 14,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 55),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Booking_step1())));
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
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
