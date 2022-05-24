import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_mysalf/my_provider/mp_provider.dart';

import 'Shared_prefrences.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
 return Consumer <MyProvideer>(
   builder : (context,provider,_){
     TextEditingController myTextControlior = TextEditingController();
     // final _model = ExampleWidgetModel();

   return Scaffold(
     body: Container(

       child: Center(

         child: Column(mainAxisAlignment: MainAxisAlignment.center,
           children: [

             TextField(controller: myTextControlior,),
             ElevatedButton(onPressed: () {
               provider.setName('${provider.myKayList.length+1}',myTextControlior.text);
               // provider.setName(myTextControlior.text, 0);
               // provider.addingList(myTextControlior.text);

               Navigator.pop(context);


             }, child: Text('save'))
           ],
         ),

       ),
     ),
   );
 });
  }
}
