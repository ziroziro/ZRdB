import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String nama;
  final String detail;
  final String jam;
  final String tahun;
  final String umur;
  final String rating;
  final String foto;
  final String foto1;
  final String foto2;
  final String foto3;
  final String foto4;
  final String foto5;
  const DetailPage({
    super.key,
    required this.nama,
    required this.detail,
    required this.jam,
    required this.tahun,
    required this.umur,
    required this.rating,
    required this.foto,
    required this.foto1,
    required this.foto2,
    required this.foto3,
    required this.foto4,
    required this.foto5,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF400863),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 2 / 2.5,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          foto,
                          fit: BoxFit.contain,
                        )),
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     height: 100,
                    //     decoration: const BoxDecoration(
                    //         gradient: LinearGradient(
                    //       colors: [Colors.black, Color.fromRGBO(0, 0, 0, 0)],
                    //       begin: Alignment.bottomCenter,
                    //       end: Alignment.topCenter,
                    //     )),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    nama,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                ),
                Text(
                  "$tahun  •  $jam  •  $umur",
                  style: const TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    detail,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            foto1,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            foto2,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            foto3,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            foto4,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            foto5,
                            height: 150,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white38,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
