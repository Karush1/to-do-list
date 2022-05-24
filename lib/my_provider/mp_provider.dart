

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvideer with ChangeNotifier{
   // final model ExampleWidgetModel();

    List<String> myList = [];
    List<String> myKayList = [];
    List<bool> myListCheck = [];


    // Color myColor =  ;
    dynamic choesColor (int index){
      if(myListCheck[index] == true){
        return Color.fromRGBO(10, 11, 22, 10);
      }else{
        return Color.fromRGBO(50, 01, 60, 10);
      }
      notifyListeners();
    }

    void reverse (int index){
      myListCheck[index] = !myListCheck[index];
      notifyListeners();
    }
    void deleteIthem ( int index ){
      myList.removeAt(index);

      myListCheck.removeAt(index);
      notifyListeners();
    }

   void addingList(String str){

      myList.add(str);
      myListCheck.add(false);
      notifyListeners();

   }
    final _storage =  SharedPreferences.getInstance();

    Future<SharedPreferences> storage(){
      return _storage;
    }

    Future <void> readName ()async {
      final storage = await _storage;
      // final name = storage.getString(kay);
      final name = storage.getStringList('kay');
      print(name);
    }
   // late final String kay;

    Future <void> setName (String kay,String  value)async {
      final storage = await _storage;
      myKayList.add(kay);
      myList.add(value);

      // storage.setString(kay, value);
      storage.setStringList('kay', myList);
      print('sa valiun e $value');
    }

    MyProvideer(){
      readName();
    }

}