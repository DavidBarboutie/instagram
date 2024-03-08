import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //appbar partie de noe
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            //ListView storie, partie de JC
            children: [
              FutureBuilder(
                  future: loadStoryFromJson(),
                  builder: (context, data) {
                    if (data.hasData) {
                      return Text(data.data!.first.name);
                    }
                    return CircularProgressIndicator();
                  }),
              //ListView publication, partie de david
              Expanded(child: ListView())
            ],
          ),
        ));
  }
}

class Story {
  int userID;
  String name;
  String img;

  Story({required this.userID, required this.name, required this.img});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      userID: json['userId'],
      name: json['name'],
      img: json['img'],
    );
  }
}

Future<List<Story>> loadStoryFromJson() async {
  List<Story> listOfStory = [];
  // Charger le contenu du fichier JSON
  final String response = await rootBundle.loadString('assets/data.json');

  // Convertir la chaîne JSON en un objet Map
  final data = jsonDecode(response);
  // Créer une instance de Person à partir du JSON
  for (int i = 0; i < (data['story'] as List<dynamic>).length; i++) {
    listOfStory.add(Story.fromJson(data['story'][i]));
  }
  return listOfStory;
}
