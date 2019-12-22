import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Loading',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Demo Loading'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;

  Widget _getWidget(){
   if (isLoading == true){
     return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         CircularProgressIndicator(strokeWidth: 5),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Text("Loading..."),
         )
       ],
     );
   }else{
     return ListView(
       children: <Widget>[
         ListTile(
           title: Text("Data Pertama"),
         ),Divider(
         ),
         ListTile(
           title: Text("Data Kedua"),
         ),Divider(
         ),ListTile(
           title: Text("Data Ketiga"),
         ),Divider(
         ),ListTile(
           title: Text("Data Keempat"),
         ),Divider(
         ),ListTile(
           title: Text("Data Kelima"),
         ),Divider(
         ),ListTile(
           title: Text("Data Keenam"),
         ),Divider(
         ),ListTile(
           title: Text("Data Ketujuh"),
         ),
       ],
     );
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _getWidget(),
          ),
          Container(
            height: 50,
            color: Colors.teal,
            child: FlatButton(
              child: Center(child: Text("Show Loading", style: TextStyle(color: Colors.white),)),
              onPressed: (){
                setState(() {
                  isLoading = true;
                  //. stop setelah 4 detik
                  Future.delayed(const Duration(milliseconds: 4000), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                });
              },
            ),
          )
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
