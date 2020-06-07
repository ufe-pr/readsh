import 'package:flutter/material.dart';
import 'package:university_times/ui/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

Color primaryColor = Color(0xFF757575);

Map<int, Color> swatch = {
  50:primaryColor.withOpacity(.1),
  100:primaryColor.withOpacity(.2),
  200:primaryColor.withOpacity(.3),
  300:primaryColor.withOpacity(.4),
  400:primaryColor.withOpacity(.5),
  500:primaryColor.withOpacity(.6),
  600:primaryColor.withOpacity(.7),
  700:primaryColor.withOpacity(.8),
  800:primaryColor.withOpacity(.9),
  900:primaryColor.withOpacity(1),
};

MaterialColor customColor = MaterialColor(0xFF757575, swatch);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uni times',
      theme: ThemeData(
        primarySwatch: customColor,
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            body1: TextStyle(
              fontSize: 13,
              color: primaryColor,
              height: 1.3,
            ),
            title: TextStyle(
              color: primaryColor,
              fontSize: 24,
            ),
          )
        ),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
        hintColor: customColor.shade300,
        tabBarTheme: TabBarTheme(
          labelStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 15.52,
            fontWeight: FontWeight.w500,
          ),
          labelColor: customColor.shade700,
          unselectedLabelColor: customColor.shade500,
          indicator: ShapeDecoration(shape: CircleBorder()),
          indicatorSize: TabBarIndicatorSize.label,
        ),
        cardTheme: CardTheme(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.06),
          ),
          color: Colors.white,
          elevation: 0,
          clipBehavior: Clip.hardEdge
        ),
        fontFamily: GoogleFonts.lato().fontFamily,

      ),
      home: Homepage(),
    );
  }
}
