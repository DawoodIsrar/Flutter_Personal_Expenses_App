import 'package:flutter/material.dart';
import '../main.dart';
class NewTrans extends StatefulWidget {
final Function addTx;

NewTrans(this.addTx);

  @override
  _NewTransState createState() => _NewTransState();
}

class _NewTransState extends State<NewTrans> {
final titleControl= TextEditingController();

final amounControl= TextEditingController();

void submitData(){
     final enterTitle = titleControl.text;
     final enterAmount = double.parse(amounControl.text);
      
     if(enterTitle.isEmpty || enterAmount<=0)
     {
       return;
     }
    widget.addTx(enterTitle,enterAmount);
    Navigator.of(context).pop();
}

  @override  
  Widget build(BuildContext context) {
    return Card(child: Container(child:
    Column(children:<Widget>[TextField(
                      decoration:
                          InputDecoration(labelText: 'Today expendeture'),
                          controller: titleControl,
                          keyboardType: TextInputType.name,
                          onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amounControl,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => submitData(),
                    ),
                    
                      FlatButton( 
                      onPressed: submitData,
                      color: Colors.blue,
                      child:Text('Add transaction') ),
                    
                    ] ) ),);
  }
}