import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrt_kozanis/bottom_nav_bar.dart';
import 'package:hrt_kozanis/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(kCalendarURL),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: const BottomNavBarFb1(),
      body: Column(
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
          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    ));
  }
}
