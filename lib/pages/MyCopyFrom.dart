import 'package:cake_project/pages/MangeShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CopyFrom extends StatefulWidget {
  const CopyFrom({super.key});

  @override
  State<CopyFrom> createState() => _CopyFromState();
}

class _CopyFromState extends State<CopyFrom> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CopyFromScreen(),
    );
  }
}
class CopyFromScreen extends StatefulWidget {
  @override
  _CopyFromScreenState createState() => _CopyFromScreenState();
}

class _CopyFromScreenState extends State<CopyFromScreen> {
  // List of options
  final List<Map<String, dynamic>> options = [
    {'name': 'Veg Toppings', 'isChecked': false},
    {'name': 'Veg Toppings', 'isChecked': false},
    {'name': 'Non Veg Toppings', 'isChecked': false},
    {'name': 'Non Veg Toppings', 'isChecked': false},
  ];

  // Function to select all items
  void selectAll(bool select) {
    setState(() {
      for (var option in options) {
        option['isChecked'] = select;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Copy From'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Headings:',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(options[index]['name']),
                    value: options[index]['isChecked'],
                    activeColor: Colors.red,
                    onChanged: (bool? value) {
                      setState(() {
                        options[index]['isChecked'] = value!;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => selectAll(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.red),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.1,
                    ),
                  ),
                  child: Text(
                    'Select All',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyManageShop()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.15,
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
