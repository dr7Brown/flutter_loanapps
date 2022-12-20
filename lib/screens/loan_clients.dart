import 'package:flutter/material.dart';
import 'package:loanapp/theme.dart';

class LoanClients extends StatefulWidget {
  const LoanClients({super.key});

  @override
  State<LoanClients> createState() => _LoanClientsState();
}

List persons = [
  'Evans Drobha',
  'Odjam Kojos',
  'Djimatey Farand',
  'Joseph Godwin Sorfa',
  'Ruth Mensah',
  'Evans Bwinah',
  'Odjam Asafo',
  'Djimatey Esther',
  'Joseph Mohammed',
  'Ruth Foddy'
];

class _LoanClientsState extends State<LoanClients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Members'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  persons[position],
                  //position.toString(),
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
