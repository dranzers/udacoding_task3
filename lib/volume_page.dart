import 'package:flutter/material.dart';

class VolumePage extends StatefulWidget {
  @override
  _VolumePageState createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  TextEditingController panjangController = TextEditingController();
  TextEditingController lebarController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();

  String hasil;

  @override
  void initState() {
    hasil = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                TextFormField(
                    controller: panjangController,
                    decoration: InputDecoration(
                        fillColor: Colors.green, hintText: 'Masukan Panjang')),
                TextFormField(
                    controller: lebarController,
                    decoration: InputDecoration(
                        fillColor: Colors.green, hintText: 'Masukan Lebar')),
                TextFormField(
                    controller: tinggiController,
                    decoration: InputDecoration(
                        fillColor: Colors.green, hintText: 'Masukan Tinggi')),
                Container(
                  color: Colors.green,
                  child: MaterialButton(
                      onPressed: () {
                        var p = double.tryParse(panjangController.text);
                        var l = double.tryParse(lebarController.text);
                        var t = double.tryParse(tinggiController.text);
                        var jumlah = p * l * t;
                        setState(() {
                          hasil = jumlah.toString();
                        });
                      },
                      child: Text(
                        'Hitung',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Text('Volume : $hasil')
              ],
            ),
          ),
        ));
  }
}
