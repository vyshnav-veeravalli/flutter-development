import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (_) => CounterModel(),
    child: const myApp(),
    ),
  );
}


class CounterModel extends ChangeNotifier{
  int _count=0;
  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }
}

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const ScreenOne(),
    );
  }
}

class ScreenOne extends StatelessWidget{
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("rendu scrrenla counter"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: ${counter.count}", style: const TextStyle(fontSize: 60),),
            const SizedBox(height: 16,width: 60,),
            ElevatedButton(onPressed: counter.increment, child: const Text("penchuraa pumka"),),
            const SizedBox(height: 16, width: 60,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ScreenTwo()),);
            }, child: const Text("thadupari screen loki dhwaramu "),),],
        ),
      ),
    );
  }
}


class ScreenTwo extends StatelessWidget{
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("rendova thera"),),
      body: Center(
        child: Text("Shared Counter: ${counter.count}", style: const TextStyle(fontSize: 28),),
      ),
    );
  }
}