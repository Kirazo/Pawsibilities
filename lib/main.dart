import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dogs.dart';
import 'doginfo.dart';
import 'search.dart';
import 'login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var url = "https://bitbucket.org/cs481group5/doggydex/raw/e75c3c49f55fdcf63044e89d85ab512affb87483/doggydexx.json";


  DogHub dogHub;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  fetchData() async{
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    dogHub = DogHub.fromJson(decodedJson);
    print(dogHub.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Doggies Search", style: TextStyle(fontSize: 18, wordSpacing: 125)),
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),
                onPressed: () {
              showSearch(context: context, delegate: DataSearch());
                })
          ]
      ),
      body: dogHub == null? Center(child: CircularProgressIndicator()):
      GridView.count(
        crossAxisCount: 2,
          children: dogHub.dog
              .map((dog) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DogDetail(
                  dog: dog,
                )));

              },
              child: Hero(
                tag: dog.image,
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(dog.image)),
                        ),
                      ),
                      Text(
                        dog.breed, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ]
                  )
                ),
              ),
            ),
          )).toList(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.cyan,
              child: DrawerHeader(
                child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset('images/avatar.png',
                      width: 125,
                      height: 125,
                      fit: BoxFit.cover,)
                    ),
                  ),
                ),
              ),
            ListTile(
              leading: Icon(Icons.search_rounded, color: Colors.deepPurple),
              title: Text('Dog List'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.map_outlined, color: Colors.blue),
              title: Text('Dog Parks'),
              onTap: (){

              },
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.favorite_outlined, color: Colors. red),
              title: Text('Favorites'),
              onTap: (){

              },
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.person, color: Colors.green),
              title: Text('Account Info'),
              onTap: (){

              },
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text('Log Out'),
              onTap: (){

              },
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  double opacity = 0;

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MyLogin())));
    changeOpacity();
  }

  changeOpacity(){
    Future.delayed(Duration(seconds: 3), (){
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 1.0;
      });
    });
  }

  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 1,
                child: Image.asset('images/wallpaper.jpg',
                fit: BoxFit.cover,
                height: 800),
              ),
              Opacity(
                opacity: 1,
                child: Image.asset('images/paw2.gif'),
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: opacity,
                child: Text(
                  'Pawsibilities',
                  style: TextStyle(color: Colors.black, fontFamily: "Smile", fontSize: 50),
                ),
              )
            ],
          )
        ),
      );
   }

    @override
    dispose() {
    //  _animationController.dispose();
      super.dispose();
    }
  }
