import 'package:flutter/material.dart';

import '../widgets/CurrencyValueField.dart';
import '../widgets/Exchaning_Process.dart';
import '../widgets/MyDropdownButton.dart';
import '../widgets/ResultContainer.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController controllerr =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 80,),
              Text("Convert anything ",style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 60,),
              CurrencyValueField(controllerr: controllerr),
              SizedBox(height: 40,),
              Exchaning_Process(),
              SizedBox(height: 40,),
              ResultContainer(),
            ],
          ),
        ),
      ),
    );
  }
}



