import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream : Firestore.instance.collection('TUT').snapshots(),
                builder :(context, snapshot) {

                  if (!snapshot.hasData) {
                  return Container(
                    height: 128,
                    width: w * 0.9,
                    child: Card(
                      elevation: 8,
                      color: Colors.white,
                      child: Text('No Items'),
                    ),
                  );
                }

                  return Container(
                    height: h*0.9,
                    width: w*0.9,
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder:( _, int index) {
                        return Container(
                          height: 128,
                          width: w*0.9,
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Text('Name: ' + snapshot.data.documents[index]['N']),
                                Text('Faction: ' + snapshot.data.documents[index]['F']),
                              ],
                            ),
                          ),
                        );
                    }),
                  );
                })
            ],
          ),
        ),
      ),
    );
  }
}
