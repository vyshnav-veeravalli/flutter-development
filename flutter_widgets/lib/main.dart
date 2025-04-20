import 'package:flutter/material.dart';

void main() => runApp(const myApp());

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "edhi oka hatath parinaamam",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MainScreen(),
    );
  } 
}

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int currentIndex = 0;

  final screens = [
    const DashboradPage(),
    const MessagePage(),
    const SettingPage(),
    const sailaja(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.lightGreenAccent,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'PALAKA'),
          BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: 'SANDESAM'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "MARPULU CHERPULU"),
          BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: "SAILAJA"),
        ],
      ),
    );
  }
}


class DashboradPage extends StatelessWidget{
  const DashboradPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          bottom: const TabBar(tabs: [
            Tab(text: "Overview"),
            Tab(text: "Tasks"),
            Tab(text: "progress"),
          ],),
        ),
        body: const TabBarView(children: [
          OverviewTab(),
          TaskTab(),
          ProgressTab(),
        ],),
      ),);
  }
}

class OverviewTab extends StatelessWidget{
  const OverviewTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(18),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text("User ${index + 1}"),
            subtitle: const Text("overview data here..."),
          ),
        );
      },
    );
  }
}

class TaskTab extends StatelessWidget{
  const TaskTab({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(18),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index){
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text("Task ${index+1}", style: const TextStyle(fontSize: 18),),
          ),
        );
      },
    );
  }
}

class ProgressTab extends StatelessWidget{
  const ProgressTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Progress coming soon", style: TextStyle(fontSize: 120),),
    );
  }
}

class MessagePage extends StatelessWidget{
  const MessagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("SAMACHARAM", style: TextStyle(fontSize: 26),),),
    );
  }
}

class SettingPage extends StatelessWidget{
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("MARPULU CERPULU ekkada chebadunu", style: TextStyle(fontSize: 26),),),
    );
  }
}

class sailaja extends StatelessWidget{
  const sailaja({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("thanu naa bhaarya", style: TextStyle(fontSize: 30),),),
    );
  }
}