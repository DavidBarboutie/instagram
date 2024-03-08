// ignore_for_file: non_constant_identifier_names, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

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
              Container(
                height: 603,
                color: Colors.black,
                child: ListView(
                  //colonne qui correspond a une unique publication
                  children: [
                    for (var i = 1; i <= 7; i++)
                      Column(
                        //ligne qui comporte la photo de profil et le nom d'utilisateur au dessus de la publication
                        children: [
                          SizedBox(
                            height: 50,
                            child: Row(
                              //photo de profil
                              children: [
                                Text("photo de PROFIL" + i.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                //nom d'utilisateur
                                Text(" username",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                          //carrousel d'image formant un post a plusierus publication
                          FlutterCarousel(
                            options: CarouselOptions(
                              height: 400.0,
                              showIndicator: true,
                              slideIndicator: CircularSlideIndicator(),
                              viewportFraction: 1.0,
                            ),
                            items: ["asset/data.json/", 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration:
                                        BoxDecoration(color: Colors.amber),
                                  );
                                },
                              );
                            }).toList(),
                          ),

                          //bas de publication
                          Column(
                            //like, commentaire, partager
                            children: [
                              Row(
                                children: [
                                  Text("LIKE ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Text("COMMENT ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Text("SHARE",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              Text("nb_like" + "j'aime",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              Text("user_id" + "description",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              Text("il y a" + "date_post",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                  ],
                ),
              )
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

//deserialization json post

class Post {
  int userID;
  List<String> img;
  String nb_like;
  String description;
  String date_post;

  Post(
      {required this.userID,
      required this.img,
      required this.nb_like,
      required this.description,
      required this.date_post});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userID: json['userId'],
        img: json['image'],
        nb_like: json['nb_like'],
        description: json['description'],
        date_post: json['date_post']);
  }
}

Future<List<Post>> loadPostFromJson() async {
  List<Post> listOfPost = [];
  // Charger le contenu du fichier JSON
  final String response = await rootBundle.loadString('assets/data.json');

  // Convertir la chaîne JSON en un objet Map
  final data = jsonDecode(response);
  // Créer une instance de Person à partir du JSON

  for (int i = 0; i < (data['post'] as List<dynamic>).length; i++) {
    if (i == 1) {
      for (int j = 0; j < (data["post"][1] as List<dynamic>).length; j++) {
        listOfPost.add(Post.fromJson(data['post'][1][j]));
      }
    }
    listOfPost.add(Post.fromJson(data['post'][i]));
  }
  return listOfPost;
}
