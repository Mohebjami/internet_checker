import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';


void main() {
  runApp(
      OverlaySupport.global(child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
      ))
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasInternet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Internet Cheeker"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: ElevatedButton(
                onPressed: () async{
                  hasInternet = await InternetConnectionChecker().hasConnection;
                  final text = hasInternet ? 'You are connect to Internet': 'You are not connect internet';
                  showSimpleNotification(
                    Text('$text' , style: TextStyle(fontSize: 30),),
                  );
                },
                child: Text("Cheek internet Connection"))),
          ],
        )
    );
  }
}
