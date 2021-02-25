import 'package:flutter/material.dart';

class FisikaPage extends StatefulWidget {

  @override
  _FisikaPageState createState() => _FisikaPageState();

}

class _FisikaPageState extends State<FisikaPage>{

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  TextEditingController panjangController = TextEditingController();
  TextEditingController lebarController = TextEditingController();

  String hasil;

  @override
  void initState() {
    hasil = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        key : _key,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                    children: [
                      TextFormField(controller: panjangController,
                          decoration: InputDecoration(
                              fillColor: Colors.green, hintText:'Masukan Panjang')),
                      TextFormField(controller: lebarController,
                          decoration: InputDecoration(
                              fillColor: Colors.green, hintText:'Masukan Lebar')),
                      Container(
                          color: Colors.green,
                          child: MaterialButton(onPressed: () {
                            var p = double.tryParse(panjangController.text);
                            var l = double.tryParse(lebarController.text);
                            var jumlah = p * l ;
                            setState(() { hasil = jumlah.toString();    });

                          },
                          child: Text('Hitung',
                                     style: TextStyle(color:Colors.white),
                                 )
                          ),
                      ),
                      Text('Luas : $hasil')
                          ],
                          ),

                          )
                              )
                              );
  }
}


