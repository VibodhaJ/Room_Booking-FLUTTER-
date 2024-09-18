// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:roombooking/view/components/navibar.dart';
import 'package:roombooking/view/screens/profile.dart';
import 'package:roombooking/view/screens/watchlist.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List imageList = [
    {"id": 1, "image_path": "assets/courasal_images/img1.png"},
    {"id": 2, "image_path": "assets/courasal_images/img2.png"},
    {"id": 3, "image_path": "assets/courasal_images/img3.png"},
    {"id": 4, "image_path": "assets/courasal_images/img4.png"},
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WatchList(),
                  ),
                );
              },
              icon: Icon(
                Icons.notifications_active,
                size: 35,
              )),
          Image.asset(
            "assets/heart.png",
            width: 80,
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.person,
            size: 35,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => profile(),
              ),
            );
          },
        ),
        title: Text(
          "Vibodha Jayasinghe",
          style: GoogleFonts.itim(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 0.0),
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "Search here ",
                      hintStyle: GoogleFonts.itim(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 95, 95),
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                    ),
                  )),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          print(entry);
                          print(entry.key);
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: currentIndex == entry.key ? 17 : 7,
                              height: 7.0,
                              margin: EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == entry.key
                                      ? Color.fromARGB(255, 2, 104, 104)
                                      : Color.fromARGB(255, 142, 142, 142)),
                            ),
                          );
                        }).toList(),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("Standed Rooms",
                          style: GoogleFonts.itim(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 87, 146),
                            fontSize: 18,
                          ))),
                  TextButton(
                      onPressed: () {},
                      child: Text("Family Rooms",
                          style: GoogleFonts.itim(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 87, 146),
                            fontSize: 18,
                          ))),
                  TextButton(
                      onPressed: () {},
                      child: Text("VIP Rooms",
                          style: GoogleFonts.itim(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 87, 146),
                            fontSize: 18,
                          ))),
                ],
              ),
              Container(
                child: Text("Recommended",
                    style: GoogleFonts.itim(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 2, 100, 104),
                      fontSize: 22,
                    )),
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      SizedBox(
                        child: Container(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  child: Image.asset(
                                    "assets/room/vip_room2.jpeg",
                                    fit: BoxFit.fill,
                                  ),
                                  width: 180,
                                  height: 180,
                                ),
                              ),
                            ],
                          ),
                        ),
                        width: 180,
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Facilities",
                style: GoogleFonts.itim(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 116, 136),
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
            ],
          ),
        ],
      ),
    );
  }
}
