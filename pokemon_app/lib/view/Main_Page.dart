import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/view/Delial.dart';
import 'package:pokemon_app/controller/Search.dart';

typedef OnChangeCallback = void Function(dynamic value);

class Main_Page_View extends StatefulWidget {
  const Main_Page_View({super.key, required this.check_Theme});
  final OnChangeCallback check_Theme;
  @override
  State<Main_Page_View> createState() => _Main_Page_ViewState();
}

class _Main_Page_ViewState extends State<Main_Page_View> {
  List? typeofpokemon;
  late List Name = [];
  List Data_Pokemon = [];
  var id;
  Future<void> show_limited() async {
    var rs = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json'));

    if (rs.statusCode == 200) {
      Data_Pokemon = jsonDecode(rs.body);
      setState(() {
        // Data_Pokemon.forEach((element) {
        //   Name.add(element['name']);
        // });
        for (int i = 0; i < Data_Pokemon.length; i++) {
          Name.add(Data_Pokemon[i]['name']);
        }
        print(Name);
      });
    }
  }

  bool check = false;
  @override
  void initState() {
    show_limited();
    check = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: TestSearch(name: Name, data: Data_Pokemon));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: (Data_Pokemon.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: Data_Pokemon.length,
              itemBuilder: (context, index) {
                typeofpokemon = Data_Pokemon[index]['typeofpokemon'];
                id = Data_Pokemon[index]['id'].split('#');
                return InkWell(
                  onTap: () {
                    // print(Data_Pokemon[index]);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Detail(
                              Data: Data_Pokemon[index],
                            )));
                  },
                  child: Card(
                    elevation: 7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Image(
                              image: NetworkImage(
                                  '${Data_Pokemon[index]['imageurl']}')),
                          trailing: (typeofpokemon!.length > 1)
                              ? Text(
                                  "${typeofpokemon!.elementAt(0)} & ${typeofpokemon!.elementAt(1)}")
                              : Text("${typeofpokemon!.elementAt(0)} "),
                          title: Text('ID: ${id[1]}'),
                          subtitle:
                              Text('Name: ${Data_Pokemon[index]['name']}'),
                        ),
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.check_Theme(check);
            if (check) {
              check = false;
            } else {
              check = true;
            }
          });
        },
        child:
            Icon(check == true ? Icons.light_mode_outlined : Icons.light_mode),
      ),
    );
  }
}
