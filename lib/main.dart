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
      appBar: AppBar(                                                     //appbar partie de noe
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,        
      ),

        body:Center(
        child: Column(
          //ListView storie, partie de JC 
          children: [ListView(

          ),
          //ListView publication, partie de david
          ListView(
          
              //colonne qui correspond a une unique publication
              children: [Column(
          
                //ligne qui comporte la photo de profil et le nom d'utilisateur au dessus de la publication
                children: [Row(
                  //photo de profil
                    children: [Image.asset(""),
                    //nom d'utilisateur
                    Text("")], 
                ),
                Text(""), //carrousel a faire
                //bas de publication
                Column(
                  //like, commentaire, partager
                  children: [Row(
                    children: [
                    Image.asset(""),
                    Image.asset(""),
                    Image.asset("")],
                  ),
                  Text("nb_like"+"j'aime"),Text("user_id"+"description"),Text("il y a"+"date_post"),], 
                )],
              )],
          )],
        ),
        )
    );
  }
}

class Person {
  int userId;
  List<String> image;
  int nb_like;
  String description;
  String date_post;

  Person({required this.userId, required this.image, required this.nb_like, required this.description, required this.date_post});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      userId: json['userId'],
      image: json['images'],
      nb_like: json['nb_like'],
      description: json['description'],
      date_post: json['date_post']
    );
  }
}

Future<Person> loadPersonFromJson() async {
  // Charger le contenu du fichier JSON
  final String response = await rootBundle.loadString('assets/data.json');
  
  // Convertir la chaîne JSON en un objet Map
  final data = jsonDecode(response);

  // Créer une instance de Person à partir du JSON
  return Person.fromJson(data);
}
