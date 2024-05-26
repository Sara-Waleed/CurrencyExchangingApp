
// import 'package:dio/dio.dart';
//
//
// Future<List<Currency>> fetchCurrencies() async {
//   final String apiUrl = 'https://openexchangerates.org/api/currencies.json?app_id=4158a4ee506b45b9b29c98da776624eb';
//   final Dio dio = Dio();
//
//   try {
//     final Response response = await dio.get(apiUrl);
//
//     if (response.statusCode == 200) {
//       // Assuming response.data is a Map<String, dynamic> and 'rates' contains the currency codes and names
//       Map<String, dynamic> data = response.data['rates'];
//       List<Currency> currencies = data.entries.map((entry) {
//         return Currency.fromJson(entry.key, entry.value.toString());
//       }).toList();
//            print (currencies);
//       return currencies;
//     } else {
//       throw Exception('Failed to load currencies');
//     }
//   } catch (error) {
//     throw Exception('Error: $error');
//   }
// }
//
//
// // Function to fetch exchange rate between two currencies
// Future<double> fetchExchangeRate(String from, String to) async {
//   final String apiUrl = 'https://openexchangerates.org/api/latest.json?app_id=4158a4ee506b45b9b29c98da776624eb';
//   final Dio dio = Dio();
//
//   try {
//     final Response response = await dio.get(apiUrl);
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> rates = response.data['rates'];
//       double fromRate = rates[from];
//       double toRate = rates[to];
//       return toRate / fromRate;
//     } else {
//       throw Exception('Failed to load exchange rate');
//     }
//   } catch (error) {
//     throw Exception('Error: $error');
//   }
// }
//
//
//
// class Currency {
//   final String code;
//   final String name;
//
//   Currency({required this.code, required this.name});
//
//   factory Currency.fromJson(String code, String name) {
//     return Currency(
//       code: code,
//       name: name,
//     );
//   }
// }


//********************
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CurrencyDropdownButton extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? initialValue;

  CurrencyDropdownButton({required this.onChanged, this.initialValue});

  @override
  _CurrencyDropdownButtonState createState() => _CurrencyDropdownButtonState();
}
class _CurrencyDropdownButtonState extends State<CurrencyDropdownButton> {
  String? _selectedValue;
  List<Currency> _dropdownItems = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchCurrencyData();
  }

  Future<void> _fetchCurrencyData() async {
    try {
      final List<Currency> currencies = await fetchCurrencies();
      setState(() {
        _dropdownItems = currencies;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _errorMessage != null
            ? Text('Error: $_errorMessage')
            : Container(
             width: 150,
              child: DropdownButton<String>(
          value: _selectedValue,
          hint: Text('Select Currency'),
          items: _dropdownItems.map((Currency currency) {
              return DropdownMenuItem<String>(
                value: currency.code,
                child: Text('(${currency.code})'),
                //${currency.name}
              );
          }).toList(),
          onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue;
              });
          },
        ),
            ),

    );
  }
}

class Currency {
  final String code;
  final String name;

  Currency({required this.code, required this.name});

  factory Currency.fromJson(String code, String name) {
    return Currency(
      code: code,
      name: name,
    );
  }
}

Future<List<Currency>> fetchCurrencies() async {
  final String apiUrl = 'https://openexchangerates.org/api/currencies.json?app_id=4158a4ee506b45b9b29c98da776624eb';
  final Dio dio = Dio();

  try {
    final Response response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      List<Currency> currencies = data.entries.map((entry) {
        return Currency.fromJson(entry.key, entry.value.toString());
      }).toList();
      return currencies;
    } else {
      throw Exception('Failed to load currencies');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}

Future<double> fetchExchangeRate(String from, String to) async {
  final String apiUrl = 'https://openexchangerates.org/api/latest.json?app_id=4158a4ee506b45b9b29c98da776624eb';
  final Dio dio = Dio();

  try {
    final Response response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> rates = response.data['rates'];
      double fromRate = rates[from];
      double toRate = rates[to];
      return toRate / fromRate;
    } else {
      throw Exception('Failed to load exchange rate');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}