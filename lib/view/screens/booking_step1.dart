import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roombooking/view/screens/bank_details.dart';
import 'package:table_calendar/table_calendar.dart';

class Booking_step1 extends StatefulWidget {
  const Booking_step1({super.key});

  @override
  State<Booking_step1> createState() => _Booking_step1State();
}

class _Booking_step1State extends State<Booking_step1> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      print(_rangeStart);
      print(_rangeEnd);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg/bg4.jpg"), fit: BoxFit.cover)),
          ),
          Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(220, 255, 255, 255)),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        "Booking Steps",
                        style: GoogleFonts.itim(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 30),
                      ),
                    ),
                  ),
                  TableCalendar(
                    focusedDay: _focusedDay,
                    headerStyle: HeaderStyle(
                        titleTextStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16),
                        formatButtonTextStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                        )),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ).copyWith(color: const Color.fromARGB(255, 0, 0, 0)),
                      weekendStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ).copyWith(color: const Color.fromARGB(255, 63, 63, 63)),
                    ),
                    firstDay: DateTime.utc(2010, 3, 14),
                    lastDay: DateTime.utc(2030, 3, 14),
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    calendarFormat: _calendarFormat,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onDaySelected: _onDaySelected,
                    rangeStartDay: _rangeStart,
                    rangeSelectionMode: RangeSelectionMode.toggledOn,
                    onRangeSelected: _onRangeSelected,
                    rangeEndDay: _rangeEnd,
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
                      selectedTextStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                      weekendTextStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 95, 95, 95),
                        fontSize: 16,
                      ),
                      outsideDaysVisible: false,
                    ),
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: ((focusedDay) {
                      _focusedDay = focusedDay;
                    }),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              children: [
                                Text("Check In",
                                    style: GoogleFonts.itim(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 9, 31, 71),
                                      fontSize: 19,
                                    )),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          182, 255, 193, 7),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text("Start Date",
                                      style: GoogleFonts.itim(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 19,
                                      )),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 80),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 5),
                            child: Column(
                              children: [
                                Text("Check Out",
                                    style: GoogleFonts.itim(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 9, 31, 71),
                                      fontSize: 19,
                                    )),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          183, 255, 193, 7),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text("End Date",
                                      style: GoogleFonts.itim(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 19,
                                      )),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text("Number Of Dates :            0",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 9, 31, 71),
                          fontSize: 19,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text("Total Amount",
                        style: GoogleFonts.itim(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 9, 31, 71),
                          fontSize: 19,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Text("Booking Price :",
                              style: GoogleFonts.itim(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 9, 31, 71),
                                fontSize: 19,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 115),
                          child: Text("Rs.  xxxxxx",
                              style: GoogleFonts.itim(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 9, 31, 71),
                                fontSize: 19,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: MaterialButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 55),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BankDetails();
                            });
                      },
                      height: 10,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      elevation: 0,
                      child: Text(
                        "Continue",
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
          ),
        ],
      ),
    );
  }
}
