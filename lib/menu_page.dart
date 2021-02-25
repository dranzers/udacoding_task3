import 'package:flutter/material.dart';
import 'package:udacoding_task3/fisika_page.dart';
import 'package:udacoding_task3/konversi_page.dart';
import 'package:udacoding_task3/volume_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Container(
                color: Colors.red,
                child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FisikaPage()));
                    },
                    child: Text(
                      'Luas Persegi',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(height: 24),
              Container(
                color: Colors.green,
                child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VolumePage()));
                    },
                    child: Text(
                      'Volume Persegi',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(height: 24),
              Container(
                color: Colors.blue,
                child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KonversiPage()));
                    },
                    child: Text(
                      'Konversi',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
