import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

<<<<<<< HEAD
  // This widget is the root of your application.
=======
>>>>>>> main
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
<<<<<<< HEAD
=======

>>>>>>> main
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
<<<<<<< HEAD

  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  
=======
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  }
>>>>>>> main

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(                                                     //appbar partie de noe
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,        
      ),

        body:Center(
        child: Column(
          //ListView storie, partie de JC 
          children: [ListView(

          ),
          //ListView publication, partie de david
          Expanded(child: ListView(
              
          ))],
        ),
        )
        
    );
  }
}
=======
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}
>>>>>>> main
