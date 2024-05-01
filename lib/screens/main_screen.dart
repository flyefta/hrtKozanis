import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hrt_kozanis/bottom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrt_kozanis/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var draseis = FirebaseFirestore.instance.collection("draseis");
  var anakoinoseis = FirebaseFirestore.instance.collection("anakoinoseis");

  late List<Map<String, dynamic>> draseisItems;
  late List<Map<String, dynamic>> anakoinoseisItems;
  bool isLoaded = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            bottomNavigationBar: const BottomNavBarFb1(),
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.topLeft,
                        child: Hero(
                          tag: 'logo',
                          child: SizedBox(
                            height: 100.0,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          'Εφαρμογή Ενημέρωσης Μελών',
                          style: GoogleFonts.syne(
                            textStyle: const TextStyle(
                                color: kEodBlue,
                                letterSpacing: .5,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    'Τελευταία Ανακοίνωση',
                    style: GoogleFonts.syne(
                      textStyle: const TextStyle(
                          color: kEodRed,
                          letterSpacing: .5,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: isLoaded
                        ? ListView.builder(
                            itemCount: anakoinoseisItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(width: 1),
                                      borderRadius: BorderRadius.circular(20)),
                                  leading: const Icon(Icons.chevron_right),
                                  title: Text(anakoinoseisItems[index]
                                          ["anakoinosi_Text"] ??
                                      "Not given"),
                                ),
                              );
                            })
                        : const Text("no data"),
                  ),
                  const Divider(),
                  Text(
                    'Επόμενη Δράση',
                    style: GoogleFonts.syne(
                      textStyle: const TextStyle(
                          color: kEodRed,
                          letterSpacing: .5,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: isLoaded
                        ? ListView.builder(
                            itemCount: draseisItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(width: 1),
                                      borderRadius: BorderRadius.circular(20)),
                                  leading: const Icon(Icons.chevron_right),
                                  title: Text(draseisItems[index]
                                          ["drasiText"] ??
                                      "Not given"),
                                  subtitle: Text(draseisItems[index]["place"] ??
                                      "δεν έχει διευκρινιστεί"),
                                ),
                              );
                            })
                        : const Text("no data"),
                  ),
                ],
              ),
            )));
  }

  _getData() async {
    List<Map<String, dynamic>> tempDraseis = [];
    List<Map<String, dynamic>> tempAnakoinoseis = [];
    var draseisData = await draseis.get();
    var anakoiseisData = await anakoinoseis.get();

    draseisData.docs.forEach((element) {
      tempDraseis.add(element.data());
    });

    anakoiseisData.docs.forEach((element) {
      tempAnakoinoseis.add(element.data());
    });

    setState(() {
      draseisItems = tempDraseis;
      anakoinoseisItems = tempAnakoinoseis;
      isLoaded = true;
    });
  }
}
