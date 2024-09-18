import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 183, 183, 183),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("Choose way to Pay",
                style: GoogleFonts.itim(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                )),
          ),
          InkWell(
            onTap: () {
              //paymentgate way link
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Icon(
                    Icons.add_card_sharp,
                    color: Color.fromARGB(255, 7, 63, 146),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Text("Credit / Debit Card",
                      style: GoogleFonts.itim(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 7, 63, 146),
                        fontSize: 20,
                      )),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //payment gateway here
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Icon(
                    Icons.money,
                    color: Color.fromARGB(255, 7, 63, 146),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Text("Others",
                      style: GoogleFonts.itim(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 7, 63, 146),
                        fontSize: 20,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
