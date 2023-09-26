// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// //You can define your own Widget
// class MyApp extends StatefulWidget  {
//   //StatefulWidget has internal "state"
//   String name;
//   int age;
//   MyApp({required this.name, required this.age});//name, age is state ? No !, it is properties
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _MyAppState();
//   }
// }
// class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
//   String _email = '';//This is state!
//   final emailEditingController = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     print("Init state");
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailEditingController.dispose();
//     WidgetsBinding.instance.removeObserver(this);
//     print("dispose");
//   }
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     if(state == AppLifecycleState.paused) {
//       print('App is in Background mode');
//     } else if(state == AppLifecycleState.resumed) {
//       print('App is in Foreground mode');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     print("buid");
//     //Now add a state
//     return MaterialApp(
//         title: "This is a StatefulWidget",
//         home: Scaffold(
//           body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     child: TextField(
//                       controller: emailEditingController,
//                       onChanged: (text){
//                         this.setState((){
//                           _email = text;//when state changed => build() rerun => reload widget
//                         });
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: const BorderRadius.all(
//                               const Radius.circular(10)
//                           ),
//                         ),
//                         labelText:'Enter your email',
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'See result here: ',
//                     style: TextStyle(fontSize: 30, color: Colors.green),
//                   ),
//                   Text(
//                     _email,
//                     style: TextStyle(fontSize: 30, color: Colors.blueAccent),
//                   ),
//                 ],
//               )
//           ),
//         )
//     );
//   }
// }

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';

//You can define your own Widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
//This is a "very basic" statefulwidget
class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //define states
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: "This is a StatefulWidget",
        home: Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
              minimum: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Content'),
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.content = text;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount(money)'),
                    controller: _amountController,
                    onChanged: (text){
                      setState(() {
                        _transaction.amount = double.tryParse(text) ?? 0;//if error, value = 0
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  ButtonTheme(
                    height: 50,
                    child: FlatButton(
                      child: Text('Insert Transaction', style: const TextStyle(fontSize: 18),),
                      color: Colors.pinkAccent,

                      textColor: Colors.white,
                      onPressed: () {
                        //print('Content = $_content, money\'s amount = $_amount');
                        //Display to UI ?
                        //Now it must add the "transaction object" to a list of transactions(state)
                        setState(() {
                          _transactions.add(_transaction);
                          _transaction = Transaction(content: '', amount: 0.0);
                          _contentController.text = '';
                          _amountController.text = '';
                        });
                        //Now I want to display the list below
                        _scaffoldKey.currentState?.showSnackBar(
                            SnackBar(
                              content: Text('transaction list : '+_transactions.toString()),
                              duration: Duration(seconds: 3),
                            )
                        );
                      },
                    ),
                  ),
                  Column(
                    children: _transactions.map((eachTransaction){
                      return ListTile(
                        leading: const Icon(Icons.access_alarm),
                        title: Text(eachTransaction.content),
                        subtitle: Text('Price: ${eachTransaction.amount}'),
                        onTap: (){
                          print('You clicked: ${eachTransaction.content}');
                        },
                      );
                    }).toList(),
                  )
                ],
              ),
            )
        )
    );
  }
}