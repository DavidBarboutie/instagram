import 'package:flutter/material.dart';

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
