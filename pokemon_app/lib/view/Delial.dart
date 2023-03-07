import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Detail({super.key, required this.Data});
  var Data;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List? typeofpokemon;
  List? weaknesses;
  List? evolutions;
  List? abilities;
  var id, evl;
  @override
  void initState() {
    typeofpokemon = widget.Data['typeofpokemon'];
    weaknesses = widget.Data['weaknesses'];
    evolutions = widget.Data['evolutions'];
    abilities = widget.Data['abilities'];
    id = widget.Data['id'].split('#');

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            colors: [
              Color.fromARGB(255, 146, 86, 252),
              Color.fromRGBO(59, 207, 207, 1),
            ],
          ),
        ),
        child: (widget.Data.isEmpty)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                backgroundColor: Color.fromARGB(0, 255, 193, 7),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30, left: 15),
                        child: SizedBox(
                          height: 200,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: -35,
                                top: -20,
                                width: 220,
                                height: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        filterQuality: FilterQuality.medium,
                                        image: NetworkImage(
                                            "${widget.Data['imageurl']}")),
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 10,
                                  top: 60,
                                  child: InkWell(
                                    child: Container(
                                      width: 170,
                                      height: 90,
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20))),
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "ID : ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${id[1]}",
                                              style: TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Name : ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${widget.Data['name']}",
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Type : ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            (typeofpokemon!.length > 1)
                                                ? Text(
                                                    "${typeofpokemon?.elementAt(0)}&${typeofpokemon!.elementAt(1)}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 13),
                                                  )
                                                : Text(
                                                    "${typeofpokemon!.elementAt(0)}",
                                                    style: const TextStyle(
                                                        fontSize: 13),
                                                  ),
                                          ],
                                        )
                                      ]),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(134, 255, 255, 255),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Category :",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Speed:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Hp:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Special Attack:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Dpecial Defense:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Weight:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Height:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Defense:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Weaknesses:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Evolutions:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Abilities:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Total:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Male percentage:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Female percentage:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Egg Groups:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Evolved From:",
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .textScaleFactor *
                                                          12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${widget.Data['category']}'),
                                              Text('${widget.Data['speed']}'),
                                              Text('${widget.Data['hp']}'),
                                              Text(
                                                  '${widget.Data['special_attack']}'),
                                              Text(
                                                  '${widget.Data['special_defense']}'),
                                              Text('${widget.Data['weight']}'),
                                              Text('${widget.Data['height']}'),
                                              Text('${widget.Data['defense']}'),
                                              (weaknesses!.length > 3)
                                                  ? Text(
                                                      "${weaknesses?.elementAt(0)}${weaknesses!.elementAt(1)}${weaknesses?.elementAt(2)}${weaknesses?.elementAt(3)}")
                                                  : (weaknesses!.length > 2)
                                                      ? Text(
                                                          "${weaknesses?.elementAt(0)} | ${weaknesses!.elementAt(1)} | ${weaknesses?.elementAt(2)} ")
                                                      : (weaknesses!.length > 1)
                                                          ? Text(
                                                              "${weaknesses?.elementAt(0)} | ${weaknesses!.elementAt(1)}  ")
                                                          : Text(
                                                              "${weaknesses?.elementAt(0)}"),
                                              (evolutions!.length > 3)
                                                  ? Text(
                                                      " ${evolutions?.elementAt(0)}${evolutions!.elementAt(1)}${evolutions?.elementAt(2)}${evolutions?.elementAt(3)}")
                                                  : (evolutions!.length > 2)
                                                      ? Text(
                                                          "${evolutions?.elementAt(0)} | ${evolutions!.elementAt(1)} | ${evolutions?.elementAt(2)}")
                                                      : (evolutions!.length > 1)
                                                          ? Text(
                                                              "${evolutions?.elementAt(0)} | ${evolutions!.elementAt(1)}  ")
                                                          : Text(
                                                              "${evolutions?.elementAt(0)}"),
                                              (abilities!.length > 3)
                                                  ? Text(
                                                      " ${abilities?.elementAt(0)} |${abilities!.elementAt(1)} | ${abilities?.elementAt(2)} | ${abilities?.elementAt(3)} ")
                                                  : (abilities!.length > 2)
                                                      ? Text(
                                                          "${abilities?.elementAt(0)} |${abilities!.elementAt(1)} | ${abilities?.elementAt(2)} ")
                                                      : (abilities!.length > 1)
                                                          ? Text(
                                                              "${abilities?.elementAt(0)} |${abilities!.elementAt(1)}  ")
                                                          : Text(
                                                              "${abilities?.elementAt(0)}"),
                                              Text('${widget.Data['total']}'),
                                              Text(
                                                  '${widget.Data['male_percentage']}'),
                                              Text(
                                                  '${widget.Data['female_percentage']}'),
                                              Text(
                                                  '${widget.Data['egg_groups']}'),
                                              (widget.Data['evolvedfrom'] != '')
                                                  ? Text(
                                                      '${widget.Data['evolvedfrom']}')
                                                  : const Text("Is hasn't"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                    right: 1,
                                    child: Container(
                                      height: 50,
                                      color: Color.fromARGB(255, 204, 34, 40),
                                      child: Column(
                                        children: [
                                          const Text(
                                            " LV ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '  ${widget.Data['base_exp']}.  ',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(blurRadius: 10, color: Colors.black)
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.keyboard_backspace),
                              Text(
                                "Back Home",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
