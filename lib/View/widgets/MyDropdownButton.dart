//  import 'package:flutter/material.dart';
//
//  // class MyDropdownButton extends StatefulWidget {
//  //   @override
//  //   _MyDropdownButtonState createState() => _MyDropdownButtonState();
//  // }
//  //
//  // class _MyDropdownButtonState extends State<MyDropdownButton> {
//  //   String? _selectedValue;
//  //   final List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
//  //
//  //   @override
//  //   Widget build(BuildContext context) {
//  //     return DropdownButton<String>(
//  //       value: _selectedValue,
//  //       hint: Text('Select'),
//  //       items: _dropdownItems.map((String item) {
//  //         return DropdownMenuItem<String>(
//  //           value: item,
//  //           child: Text(item),
//  //         );
//  //       }).toList(),
//  //       onChanged: (String? newValue) {
//  //         setState(() {
//  //           _selectedValue = newValue;
//  //         });
//  //       },
//  //     );
//  //   }
//  // }
//
//  import 'package:flutter/material.dart';
//  import 'package:dio/dio.dart';
//
// import '../../Controller/Api_Requests.dart';
//
//  class MyDropdownButton extends StatefulWidget {
//    @override
//    _MyDropdownButtonState createState() => _MyDropdownButtonState();
//  }
//
//  class _MyDropdownButtonState extends State<MyDropdownButton> {
//    String? _selectedValue;
//    List<Currency> _dropdownItems = [];
//    bool _isLoading = true;
//    String? _errorMessage;
//
//    @override
//    void initState() {
//      super.initState();
//      _fetchCurrencyData();
//    }
//
//    Future<void> _fetchCurrencyData() async {
//      try {
//        final List<Currency> currencies = await fetchCurrencies();
//        setState(() {
//          _dropdownItems = currencies;
//          _isLoading = false;
//        });
//      } catch (e) {
//        setState(() {
//          _errorMessage = e.toString();
//          _isLoading = false;
//        });
//      }
//    }
//
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//          title: Text('option'),
//        ),
//        body: Center(
//          child: _isLoading
//              ? CircularProgressIndicator()
//              : _errorMessage != null
//              ? Text('Error: $_errorMessage')
//              : DropdownButton<String>(
//            value: _selectedValue,
//            hint: Text('Select Currency'),
//            items: _dropdownItems.map((Currency currency) {
//              return DropdownMenuItem<String>(
//                value: currency.code,
//                child: Text('${currency.name} (${currency.code})'),
//              );
//            }).toList(),
//            onChanged: (String? newValue) {
//              setState(() {
//                _selectedValue = newValue;
//              });
//            },
//          ),
//        ),
//      );
//    }
//  }
