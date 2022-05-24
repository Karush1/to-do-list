// import 'package:flutter/material.dart';
//
// class ListItem extends StatelessWidget {
//   final String text ;
//   bool _isChacked = false;
//   bool get isChackedGetter {
//     return _isChacked;
//   }
//
//   reverse() {
//     _isChacked = !_isChacked;
//   }
//
//
//   ListItem({Key? key, required this.text,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
//       child: Container(
//           decoration: BoxDecoration(border: Border.all()),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween ,
//             children: [
//               Text(text,style: TextStyle(fontSize: 30),),
//               Icon(Icons.chair,),
//             ],
//           )),
//     );
//   }
// }
