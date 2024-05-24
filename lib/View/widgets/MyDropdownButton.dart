 import 'package:flutter/material.dart';
// class MainAppBar extends StatelessWidget {
//   MainAppBar({
//     super.key,
//     required this.title,
//   });
//   String title;
//   @override
//   Widget build(BuildContext context) {
//     return  Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(Icons.loop,color: Colors.black,),
//         SizedBox(width: 5,),
//         Text(
//           "$title",
//           style: TextStyle(
//               color: Colors.black,
//               fontWeight:FontWeight.bold,
//               fontSize: 25
//           ),
//         ),
//       ],
//     );
//
//   }
// }
 class MyDropdownButton extends StatefulWidget {
   @override
   _MyDropdownButtonState createState() => _MyDropdownButtonState();
 }

 class _MyDropdownButtonState extends State<MyDropdownButton> {
   String? _selectedValue;
   final List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

   @override
   Widget build(BuildContext context) {
     return DropdownButton<String>(
       value: _selectedValue,
       hint: Text('Select'),
       items: _dropdownItems.map((String item) {
         return DropdownMenuItem<String>(
           value: item,
           child: Text(item),
         );
       }).toList(),
       onChanged: (String? newValue) {
         setState(() {
           _selectedValue = newValue;
         });
       },
     );
   }
 }