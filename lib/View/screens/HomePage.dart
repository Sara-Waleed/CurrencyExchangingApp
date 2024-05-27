
import 'package:flutter/material.dart';
import '../widgets/CurrencyValueField.dart';
import '../widgets/MyDropdownButton.dart';
import '../widgets/ResultContainer.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
TextEditingController controller = TextEditingController();
String fromCurrency = ''; // Added variable to track the "From" currency
String toCurrency = '';
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

                  DropdownRow(
                    label: "From:", // Added label for "From" dropdown
                    value: fromCurrency, // Pass the variable to track "From" currency
                    currencies: {}, // Pass the currencies map
                    onChanged: (value) {
                      setState(() {
                        fromCurrency = value!;
                      });
                    },
                  ),

              SizedBox(height: 40),

                  DropdownRow(
                    label: "To:", // Added label for "To" dropdown
                    value: toCurrency, // Pass the variable to track "To" currency
                    currencies: {}, // Pass the currencies map
                    onChanged: (value) {
                      setState(() {
                        toCurrency = value!;
                      });
                    },
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




