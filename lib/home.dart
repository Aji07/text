import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(" World",
               style: TextStyle(backgroundColor: Colors.green,fontWeight: FontWeight.bold),),
        backwardsCompatibility: false,centerTitle: false, backgroundColor: Colors.green,
        actions: [
          Row(
            children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined,)),
            ],
          ),
        ],
              ),
    );
  }
}
