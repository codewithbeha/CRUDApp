import 'package:flutter/material.dart';
import './network_help.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Networking App"),
        centerTitle: true,
      ),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NetworkHelp help = NetworkHelp();
  String title = "GET";
  String bodyContent = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 25),
          Text(bodyContent == "" ? "..." : bodyContent),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 40),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  print("Get");
                  final apiData = await help.getData(6);
                  setState(() {
                    bodyContent = apiData["title"];
                    title = "GET";
                  });
                },
                child: const Text("Get"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 40),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  final apiData = await help.insertData();
                  setState(() {
                    bodyContent = apiData["id"].toString();
                    title = "POST";
                  });
                },
                child: const Text("Post"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 40),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  final apiData = await help.updateData(3);
                  setState(() {
                    bodyContent = apiData["id"].toString();
                    title = "PUT";
                  });
                },
                child: const Text("Put"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 40),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  final apiData = await help.deleteData(3);
                  setState(() {
                    // print(apiData);
                    bodyContent = "Delete successfully!";
                    title = "DELETE";
                  });
                },
                child: const Text("Del"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
