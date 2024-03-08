import 'package:flutter/material.dart';

//utilisation pour le mneu 
enum SampleItem { itemOne, itemTwo, itemThree }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String selectedOption = 'None';

void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( 
          // title: const Text('Pour vous'),
          title: const Text('Pour vous', 
          style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.heart_broken,
              color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send,
              color: Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Next Page')));
              },
            ),
          ]
        ),
        body: Center(
          child: Column(
            //partie de JC
            children: [
              ListView(),
              //partie de david
              Expanded(child: ListView())
            ],
          ),
        )
    );
  }
}
