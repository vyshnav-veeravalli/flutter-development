import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      title: "Bank App UPI",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('HDBICI Bank Account'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AccountCard(name: "Vyshnav", balance: 402015),
          AccountCard(name: "Lakshmi", balance: 204561),
          AccountCard(name: "Sailaja", balance: 189622),
          AccountCard(name: "Sailuuu", balance: 753951),
        ],
      ),
    );
  }
}


class AccountCard extends StatelessWidget{
  final String name;
  final double balance;

  const AccountCard({super.key, required this.name, required this.balance});

  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          balance >= 200000
            ? "$name has balance $balance"
            : "$name needs min of 200000 (current balance: $balance)",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}