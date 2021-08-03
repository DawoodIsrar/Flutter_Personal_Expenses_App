import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatelessWidget {
final List<Transaction> usertx;
  TransactionList(this.usertx);

  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(itemBuilder: (ctx,index){
         return Card(
                    child: Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color:
                             Theme.of(context).primaryColor,width: 5,)),
                        padding: EdgeInsets.all(5),
                        child: Text('\$${usertx[index].amount}'),//String interpolation
                      ),
                      Column(
                        children: [
                          Text(
                            usertx[index].title,
                            style:
                            TextStyle(
                              color: Theme.of(context).primaryColor, 
                              fontWeight: FontWeight.bold,fontSize: 15,),
                          ),
                          Text(DateFormat('dd-MM-yyyy').format(usertx[index].date)),
                        ],
                      )
                    ],
                  ),
                ));
      },
      itemCount: usertx.length,),
              );
  }
}
              
 