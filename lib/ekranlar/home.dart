import 'package:flutter/material.dart';
import 'package:vki_hesap/ekranlar/hakkimda.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _boyController = TextEditingController();
  TextEditingController _kiloController = TextEditingController();
  double _vkiSonuc = 0;
  String _textSonuc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "VKI Hesaplayıcı",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.black45,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _boyController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Boy",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _kiloController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ağırlık",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _b = double.parse(_boyController.text);
                  double _k = double.parse(_kiloController.text);
                  setState(() {
                    _vkiSonuc = (_k / (_b * _b / 10000));
                    if (_vkiSonuc > 30) {
                      _textSonuc = "Obez";
                    } else if (_vkiSonuc >= 25 && _vkiSonuc <= 30) {
                      _textSonuc = "Kilonuz Fazla";
                    } else if (_vkiSonuc >= 18.5 && _vkiSonuc <= 25) {
                      _textSonuc = "Kilonuz Normal";
                    } else {
                      _textSonuc = "Zayıfsınız";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Hesapla",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _vkiSonuc.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textSonuc.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textSonuc,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )),
              SizedBox.fromSize(
                child: Center(
                  child: Column(
                    // add Column
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => hakkimda()),
                          );
                        },
                        child: Text('Hakkimda!'),
                      ), // your button beneath text
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
