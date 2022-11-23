import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/main.dart';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/page/detail.dart';
import 'package:counter_7/page/budget_data.dart';
import 'package:counter_7/page/budget_form.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  Future<List<Watchlist>> fetchWatchlist() async {
    var url =
        Uri.parse('https://pbp-tugas-deploy.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Watchlist
    List<Watchlist> listMyWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchlist.add(Watchlist.fromJson(d));
      }
    }

    return listMyWatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(title: 'Program Counter')),
                  );
                },
              ),
              ListTile(
                title: const Text('Form Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman to do
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BudgetPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('My Watchlist'),
                onTap: () {
                  // Route menu ke halaman to do
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WatchlistPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "You don't have any watchlist :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.8,
                                        color: (snapshot.data![index].fields
                                                    .watched ==
                                                "Watched")
                                            ? Colors.greenAccent
                                            : Colors.redAccent,
                                      ),
                                    ),
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                        info: snapshot
                                                            .data![index]
                                                            .fields)),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              width: double.infinity,
                                              child: Text(
                                                "${snapshot.data![index].fields.title}",
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                ),
                                              )),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                  );
                }
              }
            }));
  }
}
