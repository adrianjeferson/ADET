import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget{
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      debugShowCheckedModeBanner: false,
      home: const DiceHomePage(),
    );
  }
}

class DiceHomePage extends StatefulWidget{
  const DiceHomePage({super.key});

  @override
  State<DiceHomePage> createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage>{
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  final Random random = Random();
  

  void rollDice(){
    setState(() {
      leftDiceNumber = random.nextInt(6) + 1;
      rightDiceNumber = random.nextInt(6) + 1;
      
    });
  }

  int get total => leftDiceNumber+rightDiceNumber;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dice App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset('assets/images/dice$leftDiceNumber.png',width: 180),
              const SizedBox(height: 30), 
              Image.asset('assets/images/dice$rightDiceNumber.png',width: 180),
              const SizedBox(height: 30)]),
          
          Text('Total: $total'),
          ElevatedButton(onPressed: rollDice, 
          child: const Text('Roll Dice'))],
        ),
      ),
    );
  }
}