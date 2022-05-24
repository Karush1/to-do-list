import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_mysalf/my_provider/mp_provider.dart';

import 'add_screen.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => MyProvideer())],
        child: App()),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // provider
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvideer>(builder: (context, provider, _) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                        top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          child: Icon(
                            Icons.list,
                            size: 30.0,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Todo List',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text(
                        //   '${Provider.of<TaskProvider>(context).taskCount} Tasks',
                        //   style: const TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 18,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    // child: const TasksList(),
                    child: ListView.builder(
                        itemCount: provider.myList.length,

                        itemBuilder: (context, index) {
                          int x = index;
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  provider.myList[index],
                                  // provider.myKayList[index],

                                  style: TextStyle(
                                    fontSize: 40,
                                    color: provider.myListCheck[index] == false ? Colors.red :Colors.green,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      provider.reverse(index);
                                      // provider.myList[index].isChackedGetter = !provider.myList[index].isChackedGetter;
                                    },
                                    onLongPress: () {
                                      provider.deleteIthem(index);
                                    },
                                    child: Icon(
                                        provider.myListCheck[index] == true
                                            ? Icons.check
                                            : Icons.radio_button_unchecked))
                              ],
                            )),
                          );
                        }),
                  )),
                ]),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(Icons.add),
            onPressed: () {
              // provider.myTextControlior.text = '';
              Navigator.push(
                  context,
                  // Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddScreen()));
            },
          ),
        ),
      );
    });
  }
}
