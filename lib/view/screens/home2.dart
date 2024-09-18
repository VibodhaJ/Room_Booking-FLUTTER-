import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roombooking/Model/product.dart';
import 'package:roombooking/view/screens/profile.dart';
import 'package:roombooking/view/screens/watchlist.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/cupertino.dart';

class home2 extends StatefulWidget {
  const home2({super.key});

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  List imageList = [
    {"id": 1, "image_path": "assets/courasal_images/img1.png"},
    {"id": 2, "image_path": "assets/courasal_images/img2.png"},
    {"id": 3, "image_path": "assets/courasal_images/img3.png"},
    {"id": 4, "image_path": "assets/courasal_images/img4.png"},
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  List<Product> productList = [
    Product('assets/room/family_room.jpg', 'Family Room', 9450, 11),
    Product('assets/room/standed_room.png', 'Standed Room', 4100, 10),
    Product('assets/room/vip_room.jpg', 'VIP Room', 4410, 25),
    Product('assets/room/vip_room2.jpeg', 'Vip Room ', 5559, 50),
    Product('assets/room/family_room.jpg', 'Family Room', 7815, 5),
    Product('assets/room/standed_room.png', 'Standed Room', 4520, 7),
    Product('assets/room/vip_room.jpg', 'VIP Room', 5214, 10),
    Product('assets/room/vip_room2.jpeg', 'VIP Room', 5009, 25),
    Product('assets/room/family_room.jpg', 'Family Room', 2550, 43),
    Product('assets/room/standed_room.png', 'Standed Room', 5520, 25),
  ];

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
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 0, top: 10, left: 0),
              child: Column(
                children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(199, 255, 255, 255),
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
                                color: Color.fromARGB(255, 2, 100, 104),
                                fontSize: 18,
                              ))),
                      TextButton(
                          onPressed: () {},
                          child: Text("Family Rooms",
                              style: GoogleFonts.itim(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 2, 100, 104),
                                fontSize: 18,
                              ))),
                      TextButton(
                          onPressed: () {},
                          child: Text("VIP Rooms",
                              style: GoogleFonts.itim(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 2, 100, 104),
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
                  SizedBox(
                    height: 250,
                    child: ScrollSnapList(
                      itemBuilder: _buildListItem,
                      itemCount: productList.length,
                      itemSize: 150,
                      onItemFocus: (index) {},
                      dynamicItemSize: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                          margin: EdgeInsets.symmetric(horizontal: 15),
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
                          margin: EdgeInsets.symmetric(horizontal: 15),
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
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
                                Icons.spa,
                                size: 28,
                                color: const Color.fromARGB(255, 9, 63, 108),
                              ),
                              Text("SPA",
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
            ),
          ],
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return SizedBox(
      width: 150,
      height: 300,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
                width: 150,
                height: 180,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/heart.png",
                    width: 20,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs.${product.cost}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${product.reviewCount}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 155, 127, 2)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
