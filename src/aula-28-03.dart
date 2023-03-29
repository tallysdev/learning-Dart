import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ), 
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Word")
        ),
        body: Center(
        child: Column(
          children: [
            Text("Exu")            
          ])
        ),
        bottomNavigationBar: Text("bottom")
      )
  );
  
  runApp(app);
}
