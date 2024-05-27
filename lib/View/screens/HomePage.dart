
import 'package:flutter/material.dart';
import '../widgets/CurrencyValueField.dart';
import '../widgets/ResultContainer.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                "Convert anything",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60),
              CurrencyValueField(
                controller: controller,
                onChanged: (value) {
                  // This line does not update _fromCurrency. It should update a variable if needed.
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text("From:"),
             ] ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("To:"),

                ],
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: (){},
                child: Text('Calculate'),
              ),
              SizedBox(height: 10),
              ResultContainer(
                text:'Result'
              ),
            ],
          ),
        ),
      ),
    );
  }
}




