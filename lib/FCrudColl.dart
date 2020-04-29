import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FCrudColl extends StatefulWidget {
  @override
  _FCrudCollState createState() => _FCrudCollState();
}

class _FCrudCollState extends State<FCrudColl> {

  final dbref = Firestore.instance;
  void getDataCol() async{
    await dbref.collection('TUT').getDocuments().then((data){
      data.documents.forEach((doc) {
        print(doc.data);
      });
    });
  }

  void setDataCol() async{
    await dbref.collection('TUT').add({
      'N':'Infinity',
      'F':'UNSC'
    });
  }

void setDataCol2() async{
    await dbref.collection('TUT').document('EOLX').collection('SHIPS').add({
      'N':'Infinity',
      'F':'UNSC'
    });
  }

  void delDataCol() async{
    await dbref.collection('TUT').getDocuments().then((data){
      data.documents.forEach((element) {
        dbref.collection('TUT').document(element.documentID).delete();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(onPressed: (){
              delDataCol();
            })
          ],
        ),
      ),
    );
  }
}