import 'package:currenyexchanging/screens/ExchangePage.dart';
import 'package:currenyexchanging/screens/HomePage.dart';
import 'package:currenyexchanging/widgets/AppBarTitle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: MainAppBar(title: "Currency"),
        ) ,
        body:  Center(
          child: currentIndex == 0
              ?  HomePage()
              : currentIndex == 1
              ? ExchangePage(): ExchangePage()
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(

                icon: Icon(Icons.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.currency_exchange_outlined),
                label: "Exchange"),
          ],
          currentIndex: currentIndex,
          onTap: (int index){
            setState(() {
              currentIndex=index;
            });
          },
        ),
      ),

    );
  }
}
