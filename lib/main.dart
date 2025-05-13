import 'package:flutter/material.dart';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      home: const MyHomePage(title: 'Atividade http'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nome = '';
  var email = '';
  var foto = '';

  void consultarAPI() {
    http.get(Uri.parse("https://reqres.in/api/users/"+_controllerDois.text))
        .then(
            (resposta){
          var decodedResponse = jsonDecode(utf8.decode(resposta.bodyBytes)) as Map;
          if (decodedResponse.isNotEmpty){
            var ids = decodedResponse['data'] ;
            setState(() {
                nome = ids['first_name'] +' '+ ids['last_name'];
                email = ids['email'];
                foto = ids['avatar'];
              });
          }  else {
            setState(() {
              nome = 'Usuário não encontrado!';
              email =  '';
              foto = 'https://cdn.pixabay.com/photo/2018/01/04/15/51/404-error-3060993_640.png';
            });
          }
            }
            );
          }

  TextEditingController _controllerDois = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Conferência de IDs', style: TextStyle(color: Colors.black,fontSize: 20),),
            SizedBox(height: 30),
            SizedBox(width: 200,
              child: TextField(
              controller: _controllerDois,
              decoration: InputDecoration(
                  filled: true,
                  labelText: "Insira um ID",
              ),),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () => {
                  consultarAPI()
                },
                child: Text("Buscar")),
            SizedBox(height: 30),
            Text("${nome}"),
            SizedBox(height: 10),
            Text("${email}"),
            SizedBox(height: 10),
            Image.network(foto.isNotEmpty && Uri.tryParse(foto)?.hasScheme == true ? foto : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkObBVhWRaEODDQEwVRDvU4zgh9VEctCeXIg&s',width: 100,)
          ],
        ),
      ),
    );
  }
}
