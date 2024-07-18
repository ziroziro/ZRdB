import 'package:flutter/material.dart';

import 'data_list.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController = TextEditingController();
  List<Map<String, dynamic>> getItems = [];
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    getItems = itemData();
    items = getItems;
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Map<String, dynamic>> resultList = [];
    if (query.isEmpty) {
      resultList = getItems;
    } else {
      resultList = getItems
          .where((thisisit) =>
              thisisit["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      items = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF23083C),
          title: const Text(
            "ZRDb",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
          ),
        ),
        backgroundColor: const Color(0xFF400863),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                style: const TextStyle(color: Colors.white),
                controller: editingController,
                decoration: const InputDecoration(
                    // labelText: "Search",
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white60),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.amber,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailPage(
                                    nama: itemData()[index]["name"],
                                    detail: items[index]["desc"],
                                    jam: items[index]["duration"],
                                    tahun: items[index]["year"],
                                    umur: items[index]["age"],
                                    rating: items[index]["rate"],
                                    foto: items[index]["photo0"],
                                    foto1: items[index]["photo1"],
                                    foto2: items[index]["photo2"],
                                    foto3: items[index]["photo3"],
                                    foto4: items[index]["photo4"],
                                    foto5: items[index]["photo5"],
                                  ))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 3),
                        child: Card(
                          elevation: 5,
                          key: ValueKey(items[index]["id"]),
                          color: const Color(0xFF23083C),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: 80,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            items[index]["photo0"]))),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 2 / 4 +
                                        30,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2 /
                                              6,
                                          child: Text(
                                            items[index]["name"],
                                            style: const TextStyle(
                                              color: Colors.amber,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.visible,
                                            maxLines: 2,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 20.0,
                                            ),
                                            const SizedBox(width: 3),
                                            Text(
                                              items[index]["rate"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      items[index]["desc"],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF2FB632),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "${items[index]["year"]}  •  ${items[index]["duration"]}  •  ${items[index]["age"]}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
