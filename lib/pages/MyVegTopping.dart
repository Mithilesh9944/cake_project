import 'package:cake_project/pages/MangeShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VegTopping extends StatefulWidget {
  const VegTopping({super.key});

  @override
  State<VegTopping> createState() => _VegToppingState();
}

class _VegToppingState extends State<VegTopping> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VegToppingsScreen(),
    );
  }
}
class VegToppingsScreen extends StatefulWidget {
  @override
  _VegToppingsScreenState createState() => _VegToppingsScreenState();
}

class _VegToppingsScreenState extends State<VegToppingsScreen> {
  List<Widget> toppingFields = []; // List to hold the dynamic fields

  @override
  void initState() {
    super.initState();
    // Add initial fields when screen loads
    addToppingField();
  }

  void addToppingField() {
    setState(() {
      toppingFields.add(buildToppingField());
    });
  }

  Widget buildToppingField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color:Colors.grey),
      ),
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double size = constraints.maxWidth * 0.1;
                  size = size.clamp(10.0, 30.0);

                  return CircleAvatar(
                    backgroundColor: Colors.red.withOpacity(0.2),
                    radius: size / 2, // Divide by 2 to get the correct radius
                    child: IconButton(
                      iconSize: size * 0.5, // Make the icon smaller than the background
                      icon: Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          toppingFields.removeLast();
                        });
                      },
                    ),
                  );
                },
              ),
            )
            ,
            const Text('Details:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // Allow only digits
                      LengthLimitingTextInputFormatter(5),    // Limit input to 5 digits
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Enter Price in ₹',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Food Type',
              ),
              items: ['Veg', 'Non-Veg', 'Vegan']
                  .map((String value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {},
            ),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Internship Task'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VEG TOPPINGS',
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Column(
              children: toppingFields,
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: ElevatedButton(
                onPressed: addToppingField,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.25,
                  ),
                ),
                child: Text(
                  'Insert Another Field',
                  style: TextStyle(fontSize: screenWidth * 0.03),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Note:',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. In the Description you can add things like: "Extra Cheese", "Extra Choco Chips" etc.',
              style: TextStyle(fontSize: screenWidth * 0.045),
            ),
            SizedBox(height: screenHeight * 0.02),

            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Allowed Selections: (NA if infinite)',
                border: OutlineInputBorder(),
              ),

            ),

            SizedBox(height: screenHeight * 0.03),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save action
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyManageShop()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.25,
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: screenWidth * 0.03),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}