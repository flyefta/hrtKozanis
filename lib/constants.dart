import 'package:flutter/material.dart';

const kEodBlue = Color(0xff026ab2);
const kEodRed = Color(0xffe1021b);

const kCalendarURL =
    'https://calendar.google.com/calendar/embed?height=600&wkst=1&ctz=Europe%2FAthens&bgcolor=%23ffffff&title=%CE%95%CE%9B%CE%9B%CE%97%CE%9D%CE%99%CE%9A%CE%97%20%CE%9F%CE%9C%CE%91%CE%94%CE%91%20%CE%94%CE%99%CE%91%CE%A3%CE%A9%CE%A3%CE%97%CE%A3%20-%20%CE%A0%CE%91%CE%A1%CE%91%CE%A1%CE%A4%CE%97%CE%9C%CE%91%20%CE%9D.%20%CE%9A%CE%9F%CE%96%CE%91%CE%9D%CE%97%CE%A3&mode=AGENDA&showTabs=0&showPrint=0&showCalendars=0&showTz=0&src=YTU3NzI5NzY2Mjk2NTNmMDRjNDliMWU4M2U3Yjk1NjllYzUyMWI1MGNlMzAyMjgzZjQxN2Q1M2EyMzQwZDgyNUBncm91cC5jYWxlbmRhci5nb29nbGUuY29t&color=%23F4511E" style="border:solid 1px #777" width="800" height="600" frameborder="0" scrolling="no"';

const kSendButtonTextStyle = TextStyle(
  color: kEodBlue,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Aa',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kEodBlue, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kEodBlue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
