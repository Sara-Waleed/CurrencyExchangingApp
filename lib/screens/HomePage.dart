import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);
// Step 1.

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Dog';
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Dog';
    return Padding(
        padding: const EdgeInsets.only(right: 10.0,left: 10,top: 25,bottom: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  HeadLineTitle(title: "Base Currency"),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300
                    ),
                    child:
// Step 2.
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      // Step 3.
                      value: dropdownValue,
                      // Step 4.
                      items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      }).toList(),
                      // Step 5.
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Column(
              children: [
                HeadLineTitle(title: "Currency:"),
               SizedBox(height: 5,),
                 Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                    itemBuilder:(context, index) =>  Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300
                      ),
                      child:
// Step 2.
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          // Step 3.
                          value: dropdownValue,
                          // Step 4.
                          items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 30),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ) ,
                    separatorBuilder: (context, index) => Divider(height: 10,),
                    itemCount: 10),
                  ),
              ],
            ),
          ],
        ),
      );

  }
}

class HeadLineTitle extends StatelessWidget {
   HeadLineTitle({
    super.key,
     required this.title
    
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text("$title",style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold
      ),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}

class ListviewContent extends StatelessWidget {
  const ListviewContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300
      ),
      child:Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ADA"),
          Text("2.28"),
        ],
      )
    );
  }
}
