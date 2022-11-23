import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/page/budget_data.dart';
import 'package:counter_7/page/budget_form.dart';
import 'package:counter_7/page/mywatchlist.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.info});

  final Fields info;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        // Menambahkan drawer menu
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
                title: const Text('Tambah Budget'),
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                widget.info.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Release Date: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: widget.info.releaseDate),
                    const TextSpan(
                        text: '\nRating: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: widget.info.rating.toString()),
                    const TextSpan(
                        text: '\nStatus: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: widget.info.watched),
                    const TextSpan(
                        text: '\nReview:\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: widget.info.review),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45)),
                  onPressed: (() => Navigator.pop(context)),
                  child: const Text(
                    'Back',
                    style: TextStyle(fontSize: 14),
                  ))
            ],
          ),
        ));
  }
}
