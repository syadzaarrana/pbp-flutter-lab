import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/model/budget.dart';
import 'package:counter_7/page/budget_form.dart';
import 'package:counter_7/page/mywatchlist.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  Future<List<Budget>> fetchBudget() async {
    return MyFormPage.updateBudget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
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
          future: fetchBudget(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum ada budget",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.black, blurRadius: 1.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].title}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text("${snapshot.data![index].nominal}"),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${snapshot.data![index].type}",
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
              }
            }
          }),
    );
  }
}
