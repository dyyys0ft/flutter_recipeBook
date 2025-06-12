import 'package:flutter/material.dart';
import 'package:platzi_project/screens/home_screen.dart';

void main() => runApp(const MyApp()); //EJECUTAR LA APP

class MyApp extends StatelessWidget {
  //constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi primera app',
      home: Center(child: RecipeBook()),
    );
  }
}

class RecipeBook extends StatelessWidget {
  //su estado no es dinamico

  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Recipe book!', style: TextStyle(color: Colors.white)),
          bottom: TabBar(
            tabs: [Tab(icon: Icon(Icons.home), text: 'Home')],
          ),
        ),
        body: TabBarView(children: [HomeScreen()]),
      ),
    );
  }
}
