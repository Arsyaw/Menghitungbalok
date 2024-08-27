import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(ScaffoldWidget());
}

class ScaffoldWidget extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ScaffoldWidget> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menghitung Luas dan Volume Balok'),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(_themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: _toggleTheme,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BalokForm(),
        ),
      ),
    );
  }
}

class BalokForm extends StatefulWidget {
  @override
  _BalokFormState createState() => _BalokFormState();
}

class _BalokFormState extends State<BalokForm> {
  final _panjangController = TextEditingController();
  final _lebarController = TextEditingController();
  final _tinggiController = TextEditingController();
  double _luas = 0;
  double _volume = 0;
  String _errorMessage = '';

  void _hitungLuasDanVolume() {
    final double panjang = double.tryParse(_panjangController.text) ?? 0;
    final double lebar = double.tryParse(_lebarController.text) ?? 0;
    final double tinggi = double.tryParse(_tinggiController.text) ?? 0;
    if (panjang == null ||
        lebar == null ||
        tinggi == null ||
        panjang <= 0 ||
        lebar <= 0 ||
        tinggi <= 0) {
      _errorMessage = 'Masukkan nilai yang valid';
      _volume = 0;
      _luas = 0;
    } else {
      _errorMessage = '';
      _luas = 2 * (panjang * lebar + panjang * tinggi + lebar * tinggi);
      _volume = panjang * lebar * tinggi;
    }

    setState(() {
      _luas = 2 * (panjang * lebar + panjang * tinggi + lebar * tinggi);
      _volume = panjang * lebar * tinggi;
    });
  }

  @override
  void dispose() {
    _panjangController.dispose();
    _lebarController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: _panjangController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Panjang',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _lebarController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Lebar',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _tinggiController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Tinggi',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _hitungLuasDanVolume,
          child: Text('Hitung Luas dan Volume'),
        ),
        SizedBox(height: 16),
        if (_errorMessage.isNotEmpty)
          Text(
            _errorMessage,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        if (_errorMessage.isEmpty) Text('Volume = $_volume'),
        if (_errorMessage.isEmpty) Text('Luas= $_luas')
      ],
    );
  }
}
