import 'package:cake_project/pages/MyCopyFrom.dart';
import 'package:cake_project/pages/MyNumerical.dart';
import 'package:cake_project/pages/MyVegTopping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyManageShop extends StatefulWidget {
  const MyManageShop({super.key});

  @override
  State<MyManageShop> createState() => _MyManageShopState();
}

class _MyManageShopState extends State<MyManageShop> {
  @override
  Widget build(BuildContext context) {
    // Screen width and height
    final _commision = 10;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Internship Task'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, // 5% of screen width
            vertical: screenHeight * 0.02,  // 2% of screen height
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MANAGE SHOP',
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // Font size adapts to screen width
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Shop Name:',
                style: TextStyle(fontSize: screenWidth * 0.045),
              ),
              Text(
                'Hub Quality Bakers',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'FSSAI License Number:',
                style: TextStyle(fontSize: screenWidth * 0.045),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                '873687DHDHJH122',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Text(
                'Commission %:',
                style: TextStyle(fontSize: screenWidth * 0.045),
              ),
              Text(
                  _commision.toString(),
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Add Shop Display Photo (Max 1):',
                style: TextStyle(fontSize: screenWidth * 0.045),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.003,
                      horizontal: screenWidth * 0.20,
                    ),
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Add Image',
                    style: TextStyle(fontSize: screenWidth * 0.05),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                width: screenWidth * 0.15, // 40% of screen width
                height: screenHeight * 0.08, // 20% of screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Icon(Icons.add_photo_alternate, size: screenWidth * 0.1),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                title: Text(
                  'Veg Toppings',
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VegTopping()));
                }

              ),
              ListTile(
                title: Text(
                  'Copy From',
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                trailing:  Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05),
               onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CopyFrom()));
               },

              ),
              ListTile(
                title: Text(
                  'Numerical',
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyNumerical()));
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VegTopping()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.25,
                    ),
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: screenWidth * 0.05),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
