import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dogs.dart';
import 'doginfo.dart';


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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var url = "https://bitbucket.org/cs481group5/doggydex/raw/d429d686b9c4c2677bd7eb31d7a853a26c7e9bc6/doggydexx.json";


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
        title: Text("Dogs"),
        backgroundColor: Colors.cyan,
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
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
