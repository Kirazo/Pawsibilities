import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dogs.dart';
import 'doginfo.dart';

class DataSearch extends SearchDelegate<String>{
  //final Dog dog;
  //DataSearch({this.dog});
  dog dogs = dog.fromJson(jsonDecode("https://bitbucket.org/cs481group5/doggydex/raw/6d661cbdf44f5c624bcac8f0452c2400c512c19e/doggydexx.json"));

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [IconButton(icon: Icon(Icons.clear),
        onPressed:() {query = "";})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation),
        onPressed: () {close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some results based on the selection

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something
    return ListView.builder(itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.pets),
      //title: Text("${dogs.breed}"),
    ),
      //itemCount: suggestionList.length,
    );
  }
  
}

class dog {
  String breed;

  dog(this.breed);
  factory dog.fromJson(dynamic json) {
    return dog(json['breed'] as String);
  }
  @override
  String toString() {
    return '{ ${this.breed} }';
  }
}