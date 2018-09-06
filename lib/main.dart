import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.teal
  ),
  home: HomePage(),
));
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("People"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: Center(
         child: FutureBuilder(
             future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
             builder: (context,snapshot){
               //decode json
               var mydata = JSON.decode(snapshot.data.toString());
               return ListView.builder(
                   itemBuilder: (BuildContext context,int index){
                     return Card( elevation: 8.0,
                       color: Colors.orange.shade300,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: <Widget>[
                           Text("Name        : "+mydata[index]['name'],style: _personText(),),
                           Text("Age            : "+mydata[index]['age'],style: _personText(),),
                           Text("Height       : "+mydata[index]['height'],style: _personText(),),
                           Text("Gender      : "+mydata[index]['gender'],style: _personText(),),
                           Text("Hair Color : "+mydata[index]['haircolor'],style: _personText(),),

                         ],
                       ),
                     );
                   },
                  itemCount: mydata == null ?0:mydata.length,

               );
             }
         ),
        ),
      ),
    );
  }
} TextStyle _personText(){
  return TextStyle(
    color: Colors.blue,
    fontSize: 17.5,
    fontStyle: FontStyle.italic,
    fontWeight:FontWeight.bold
  );
}