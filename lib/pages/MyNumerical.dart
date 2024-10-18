import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyNumerical extends StatefulWidget {
  const MyNumerical({super.key});

  @override
  State<MyNumerical> createState() => _MyNumericalState();
}

class _MyNumericalState extends State<MyNumerical> {
  List<Widget> fields = [];

  @override
  void initState() {
    super.initState();
    addField(); // Add initial field on load
  }

  void addField() {
    setState(() {
      fields.add(buildField());
    });
  }

  Widget buildField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Details:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: buildTextField("Promo Code")),
                const SizedBox(width: 8),
                Expanded(child: buildTextField("Usage Limit/User")),
                const SizedBox(width: 8),
                Expanded(child: buildTextField("Min. Order Value")),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5),
                  ],
                  decoration: const InputDecoration(
                      labelText: 'Amount in ₹', border: OutlineInputBorder()),
                )),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      border: const OutlineInputBorder(),
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

  Widget buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Internship Task"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    children: fields,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: addField,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red button
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                    ),
                    child: Text("Insert Another Field"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red button
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                    ),
                    child: Text("Save"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
