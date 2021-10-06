import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'dart:async';

Future<ConsumerData> getConsumerData()async{
  var res= await http.get(Uri.parse('https://globytex.com/santhi_online/wp-json/wc/v3/customers/1234?consumer_key=ck_a716c6f7e95a7a5f3a871efa46826aa4b6d4fb81&consumer_secret=cs_a5fbc3de3f31347c11c731240f2e4d9b3cbc4902'));
  print('${res.toString()}');
  print('${res.body.toString()}');
  //Map<String, dynamic> map = jsonDecode(res.body);
  //String email=map['email'];
  if(res.statusCode==200)
  {
    return ConsumerData.fromJson(jsonDecode(res.body));
  }
  else{
    print('error');
    throw Exception('Failed to load ConsumerData');
  }
}
class ConsumerData {
 final String email;
 final String first_name;
 final String last_name;
 final String username;
 //final List<dynamic> billing;


 ConsumerData({
   required this.email,
   required this.first_name,
   required this.last_name,
   required this.username,
   //required this.billing,
 });

  factory ConsumerData.fromJson(Map<String , dynamic>json)
{
  return ConsumerData(
    email:json['email'],
    first_name:json['first_name'],
    last_name:json['last_name'],
    username:json['username'],
   //billing:json['billing'],
  );
}
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Future<ConsumerData>? futureConsumerData;
  @override
  void initState() {
    super.initState();
    futureConsumerData = getConsumerData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text("Hello",
               style: TextStyle(backgroundColor: Colors.green,fontWeight: FontWeight.bold),),
        backwardsCompatibility: false,centerTitle: false, backgroundColor: Colors.green,
        actions: [
          Row(
            children: [
             IconButton(onPressed: (){print('${futureConsumerData.toString()}');}, icon: Icon(Icons.search_rounded,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined,)),
            ],
          ),
        ],
              ),
      body: Center(
        child: FutureBuilder<ConsumerData>(
          future: futureConsumerData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //print("${snapshot.data!.billing[1]}");
              return 
                Column(
                  children: [
                    Text(snapshot.data!.first_name+snapshot.data!.last_name),
                    Text(snapshot.data!.email),
                    Text(snapshot.data!.username),
                    //Text(snapshot.data!.billing[1]),
                  ],
                );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
