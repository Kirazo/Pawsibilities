import 'package:flutter/material.dart';
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

  DogHub dogHub;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  fetchData() async{
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dogs"),
        backgroundColor: Colors.cyan,
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(10, (index){
            return Container(
              child: InkWell(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DogDetail(
                    )));
                },
                  child: Card(
                   color: Colors.grey,
                    child: Text(
                        'Item $index',
                         style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.center
                    ),
                   ),
              ),
            );
          }),
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
