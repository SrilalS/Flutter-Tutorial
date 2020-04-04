import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fcrud extends StatefulWidget {
  @override
  _FcrudState createState() => _FcrudState();
}

class _FcrudState extends State<Fcrud> {
  final docref = Firestore.instance.collection('TUT').document('0');
  String txt = 'Click The Button';

  void docread() {
    docref.get().then((doc) {
      setState(() {
        txt = doc.data['N'];
      });
    });
  }

  void docwrite() {
    docref.setData(
      {
        'N' : 'Donnager',
        'F' : 'MCRN'
      }
    );
  }

  void docdel(){
    docref.delete();
  }

  void docmake(){
    docref.updateData({
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(txt),
            RaisedButton(onPressed: () {
              docdel();
            })
          ],
        ),
      ),
    );
  }
}
