
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

Future<List<Currency>> fetchCurrencies() async {
  final String apiUrl = 'https://openexchangerates.org/api/currencies.json?app_id=4158a4ee506b45b9b29c98da776624eb';
  final Dio dio = Dio();

  try {
    final Response response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      // Assuming response.data is a Map<String, dynamic> and 'rates' contains the currency codes and names
      Map<String, dynamic> data = response.data['rates'];
      List<Currency> currencies = data.entries.map((entry) {
        return Currency.fromJson(entry.key, entry.value.toString());
      }).toList();
           print (currencies);
      return currencies;
    } else {
      throw Exception('Failed to load currencies');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}


// Function to fetch exchange rate between two currencies
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