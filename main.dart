
import 'dart:ui';
import 'package:flutter/gestures.dart';
import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './Models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transList.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontFamily: 'QuickSand',fontSize: 20) )),
        accentColor: Colors.green
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

final List<Transaction> _userTx=[
     Transaction(
          id: 't2', title: 'laptop', amount: 200000.00, date: DateTime.now()),
      Transaction(
          id: 't4', title: 'Apple', amount: 250000.00, date: DateTime.now())
  ];
  void _addTransaction(String txtitle, double txamount){
    final newTx=Transaction(id: DateTime.now().toString(), title: txtitle, amount: txamount, date: DateTime.now()); 
    setState(() {
       _userTx.add(newTx);
    });
  }
 void _startAddNewTransaction(BuildContext ctx){
      showModalBottomSheet(context: ctx, builder: (_) {
        return GestureDetector(
          onTap:(){},
          child: NewTrans( _addTransaction),
          behavior: HitTestBehavior.opaque,
        ) ;
      });
 }

 @override
  Widget build(BuildContext context) {
    
    //String inputTitle;
    //String inputAmount;
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context) ),
          ],
        ),
        body: SingleChildScrollView(
            //also Singlechildscrollview can use list view or list view builder which also give scrollable widgets
            
            child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.blue,
                        elevation: 5,
                        child: Text('list'),
                      ),),
                    TransactionList(_userTx),     
          ]),
            
        ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(child:
           Icon(Icons.add), onPressed: () => _startAddNewTransaction(context)),
          );         
  }
}
