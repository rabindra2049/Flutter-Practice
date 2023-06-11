import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

List<String> list = [];

StreamControl streamControl = StreamControl();

TextEditingController messageEditController = TextEditingController();
@override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2));

  }
  @override
    void dispose() {
      streamControl.dispose();
      messageEditController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder(
          stream: streamControl.getResponse,
          builder: (context, AsyncSnapshot<List<String>> snapShot){
            if(snapShot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if(snapShot.connectionState == ConnectionState.active ||
            snapShot.connectionState == ConnectionState.done){
              if(snapShot.hasError){
                return Text(snapShot.error.toString());
              }else if(snapShot.hasData){
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return Text(snapShot.data![index].toString());
                  },
                );
              }else{
                return Text("Something went wrong");
              }
            }else{
              return Text("Something went wrong");
            }
          },
        ),
          ),
      Row(
        children: [
          Expanded(
            child: TextField(
            
              controller: messageEditController,
            decoration: InputDecoration(
              hintText: "Enter Message"
            ),
            ),
          ),
          IconButton(
            onPressed: (){
             list.add(messageEditController.text.toString());
              streamControl.addResponse(list);
              messageEditController.clear();
            },
            icon: Icon(Icons.send),
          )
        ],
      )
        ],
      )
    );
  }
}

class StreamControl {
  final _streamController = StreamController<List<String>>.broadcast();

  void Function(List<String>) get addResponse => _streamController.sink.add ;

  Stream<List<String>> get getResponse => _streamController.stream.asBroadcastStream();

void dispose(){
  _streamController.close();
}
}