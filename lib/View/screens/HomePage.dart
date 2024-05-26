import 'package:flutter/material.dart';
import '../../Controller/Api_Requests.dart';
import '../widgets/CurrencyValueField.dart';
import '../widgets/Exchaning_Process.dart';
import '../widgets/ResultContainer.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController controllerr =TextEditingController();
   String FromValue='';
   String ToValue='';
   String inputValue='';
  String result = 'Result';
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
              CurrencyValueField(
                controller: controllerr,
                onChanged: (value) {
                  setState(() {
                    inputValue = value;
                  });
                },
              ),
              SizedBox(height: 30,),
              CurrencyDropdownButton(onChanged: (value) {
                FromValue=value;
              },),
              SizedBox(height: 40,),
              CurrencyDropdownButton(onChanged: (value) {
                ToValue=value;
              },),

              //*****
              ElevatedButton(
                onPressed: () async {
                  if (FromValue.isNotEmpty && ToValue.isNotEmpty && inputValue.isNotEmpty) {
                    double rate = await fetchExchangeRate(FromValue, ToValue);
                    setState(() {
                      result = (double.parse(inputValue) * rate).toStringAsFixed(2);
                    });
                  } else {
                    setState(() {
                      result = 'Please select both currencies and enter a value.';
                    });
                  }
                },
                child: Icon(Icons.currency_exchange_outlined),
              ),
              //***************
              SizedBox(height: 80,),
              ResultContainer(text:inputValue.isEmpty ? 'Result' :inputValue,),
            ],
          ),
        ),
      ),
    );
  }
}



