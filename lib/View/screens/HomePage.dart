
import 'package:flutter/material.dart';
import '../../Controller/Api_Requests.dart';
import '../../models/convertModel.dart';
import '../widgets/ConversionCard.dart';
import '../widgets/CurrencyValueField.dart';
import '../widgets/MyDropdownButton.dart';
import '../widgets/ResultContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RatesModel> ratesModel;
  late Future<Map> currenciesModel;
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _showMessageAfterDelay();
  }

  Future<void> _fetchData() async {
    ratesModel = fetchRates();
    currenciesModel = fetchCurrencies();
  }

  Future<void> _showMessageAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      showMessage = true;
    });
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      showMessage = false;
    });
  }

  Future<void> _restartApp() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(Icons.currency_exchange),
        title: const Text('Currency Convertor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _restartApp,
          ),
        ],
      ),
      body: FutureBuilder<RatesModel>(
        future: ratesModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder<Map>(
              future: currenciesModel,
              builder: (context, index) {
                if (index.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (index.hasError) {
                  return Center(child: Text('Error: ${index.error}'));
                } else if (index.data == null) {
                  return const Center(child: Text('No data available'));
                } else {
                  return Column(
                    children: [
                      if (showMessage) // Show message conditionally
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'You can turn off your mobile data..',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Expanded(
                        child: ConversionCard(
                          rates: snapshot.data!.rates,
                          currencies: index.data!,
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}


// class App extends StatefulWidget {
//   const App({Key? key}) : super(key: key);
//
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> {
// TextEditingController controller = TextEditingController();
// String fromCurrency = ''; // Added variable to track the "From" currency
// String toCurrency = '';
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               SizedBox(height: 80),
//               Text(
//                 "Convert anything",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 60),
//               CurrencyValueField(
//                 controller: controller,
//                 onChanged: (value) {
//                   // This line does not update _fromCurrency. It should update a variable if needed.
//                 },
//               ),
//               SizedBox(height: 30),
//
//                   DropdownRow(
//                     label: "From:", // Added label for "From" dropdown
//                     value: fromCurrency, // Pass the variable to track "From" currency
//                     currencies: {}, // Pass the currencies map
//                     onChanged: (value) {
//                       setState(() {
//                         fromCurrency = value!;
//                       });
//                     },
//                   ),
//
//               SizedBox(height: 40),
//
//                   DropdownRow(
//                     label: "To:", // Added label for "To" dropdown
//                     value: toCurrency, // Pass the variable to track "To" currency
//                     currencies: {}, // Pass the currencies map
//                     onChanged: (value) {
//                       setState(() {
//                         toCurrency = value!;
//                       });
//                     },
//                   ),
//
//               SizedBox(height: 40,),
//               ElevatedButton(
//                 onPressed: (){},
//                 child: Text('Calculate'),
//               ),
//               SizedBox(height: 10),
//               ResultContainer(
//                 text:'Result'
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//



