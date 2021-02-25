import 'package:flutter/material.dart';

class KonversiPage extends StatefulWidget{

  @override
  _KonversiPageState createState() => _KonversiPageState();

}

class _KonversiPageState extends State<KonversiPage>{

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TextEditingController inputController = TextEditingController();

  final Map<String, int> _satuanPanjang = {
    'km' : 1,
    'hm' : 2,
    'dam': 3,
    'm': 4,
    'dm': 5,
    'cm': 6,
    'mm': 7
  };

  final dynamic _konversi = {
    '1': [1, 10, 100, 1000, 10000, 100000, 1000000],
    '2': [0.1, 1, 10, 100, 1000, 10000, 100000],
    '3': [0.01, 0.1, 1, 10, 100, 1000, 10000],
    '4': [0.001, 0.01, 0.1, 1, 10, 100, 1000],
    '5': [0.0001, 0.001, 0.01, 0.1, 1, 10, 100],
    '6': [0.00001, 0.0001, 0.001,0.01,0.1, 1, 10],
    '7': [0.000001, 0.00001, 0.0001, 0.001, 0.01, 0.1, 1],
  };

  List<DropdownMenuItem<String>> _listWidget;
  String _from, _to, _result;

  @override
  void initState() {
    _result = '';
    _from = _satuanPanjang.keys.first.toString();
    _to = _satuanPanjang.keys.last.toString();
    _listWidget = _satuanPanjang.keys.map<DropdownMenuItem<String>>((e) {
      return DropdownMenuItem<String>(value : e, child : Text(e));
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        key: _key,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                    children: [
                      DropdownButton<String>(
                          value: _from,
                          items : _listWidget,
                          onChanged: (newValue) {
                            setState(() {
                              _from = newValue;
                            });
                          }
                      ),
                      DropdownButton<String>(
                          value: _to,
                          items : _listWidget,
                          onChanged: (newValue) {
                            setState(() {
                              _to = newValue;
                            });
                          }
                      ),
                      TextFormField(controller: inputController,
                          decoration: InputDecoration(
                              fillColor: Colors.green, hintText:'Masukan Angka')),

                      Container(
                          color: Colors.green,
                          child: MaterialButton(
                              onPressed: () {
                                var fromValue = _satuanPanjang[_from];
                                var fromTo = _satuanPanjang[_to] - 1;
                                var value = inputController.text.isEmpty ? 0 : double.tryParse( inputController.text);
                         
                                print('fromValue : ${fromValue.toString()}');
                                print('fromTo : ${fromTo.toString()}');
                                print('value : ${value.toString()}');
                             var konversi = _konversi[fromValue.toString()][fromTo] * value;
                             print('hasil konversi $konversi');
                            setState((){
                           _result = konversi.toString(); 
                            }); 
                              },
                              child: Text('Konversi',
                                         style: TextStyle(color:Colors.white),
                                     )
                          ),
                      ),
                      Text('hasil konversi : $_result'),
                      ],
                      ),

                      ),
                      )
                          );
  }
}
