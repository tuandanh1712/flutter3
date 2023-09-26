import 'package:flutter/material.dart';

import 'MyApp.dart';

void main() {
  // runApp( MaterialApp(
  //   home: SafeArea(
  //     child: Scaffold(
  //       // body: Center(child: MyWidget2(false)),
  //       body:  MyWidget1(),
  //     ),
  //   ),
  //   debugShowCheckedModeBanner: false,
  // ));
  runApp(
      // MyApp(name: 'Hoang',age: 18)//How to send arguments/params to this Widget ?
     MyApp()

  );
}
class MyWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Card(
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(width: 10,),
              
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dao Danh Tuan",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("Tân kì, Nghệ An",style: TextStyle(fontSize: 14),),
                  ],
                ),
              ),
              Container(
                width: 15,
                height: 15,
                color: Colors.red
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 15,
                      height: 15,
                      color: Colors.red
                  ),
                  Text("20")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}








// class MyWidget1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           color: Colors.green,
//         ),
//         Positioned(
//           bottom: 20,
//           right: 10,
//           left: 10,
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0)
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Column(
//                 children: [
//                   Text("Danh tuan",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
//                   SizedBox(height: 20,),
//                   Text("Sada sdas dsasa das,dálmc lsamasl djwodj sknas kcn skn sakds dkasm dkasdkl snxcka snxk sandasda ksc nakjc sdsad asda sdas áda sdasd asd")
//                 ],
//               ),
//             ),
//
//           ),
//         )
//       ],
//     );
//   }
//
// }


// class MyWidget1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin:const EdgeInsets.all(20) ,
//       child:  Column(
//         children: [
//           Row(
//             children: [
//               SizedBox(width: 80,child:(
//                   Text("Username",style: TextStyle(color: Colors.black,fontSize: 14),)
//               ) ,),
//               Text("Nguyen Van A",style: TextStyle(color: Colors.black,fontSize: 14),),
//             ],
//           ),
//           Row(
//             children: [
//               SizedBox(width: 80,child:(
//                   Text("Email",style: TextStyle(color: Colors.black,fontSize: 14),)
//               ) ,),
//               Text("Nguyen Van A",style: TextStyle(color: Colors.black,fontSize: 14),),
//             ],
//           ),
//           Row(
//             children: [
//               SizedBox(width: 80,child:(
//                   Text("Address",style: TextStyle(color: Colors.black,fontSize: 14),)
//               ) ,),
//               Text("Nguyen Van A",style: TextStyle(color: Colors.black,fontSize: 14),),
//             ],
//           ),
//           SizedBox(height: 10,),
//           Row(
//                 children: [
//                Expanded(child: ElevatedButton(onPressed: (){}, child:
//                  Text("ádas")
//                  ,)
//                ),
//                   Expanded(child: ElevatedButton(onPressed: (){}, child:
//                   Text("ádas")
//                     ,)
//                   )
//                 ],
//               ),
//         ],
//       ),
//     );
//   }
//
// }






// class MyWidget1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RichText(text: TextSpan(
//           style: DefaultTextStyle.of(context).style,
//           children: const <TextSpan>[
//             TextSpan(text: "Hello"),
//             TextSpan(text: "Tuan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange)),
//             TextSpan(text: "Nha"),
//           ]
//       )
//       ),
//     );
//   }
//
// }


// //StatelessWidget không set lại trạng trái state
// class MyWidget1 extends StatelessWidget {
//   final bool loading;
//
//   const MyWidget1(this.loading);
//
//   @override
//   Widget build(BuildContext context) {
//     return loading ? CircularProgressIndicator() : const Text("StatelessWidget");
//   }
// }
//
//
// //StatefulWidget có thể set lại trạng trái state(setState)
// class MyWidget2 extends StatefulWidget {
//   final bool loading;
//
//   MyWidget2(this.loading);
//
//   @override
//   State<StatefulWidget> createState() {
//     return MyWidget2State();
//   }
// }
// class MyWidget2State extends State<MyWidget2> {
//   late bool _localloading;
//   // hàm initState sẽ gọi sau hàm khởi tạo contruction MyWidget2
//   // nhưng chạy trước hàm build ở trong MyWidget2State
//   @override
//   void initState() {
//     _localloading=widget.loading;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return _localloading ? CircularProgressIndicator() : FloatingActionButton(onPressed: ClickButton);
//   }
// void ClickButton(){
//     setState(() {
//       _localloading=true;
//     });
// }
// }
