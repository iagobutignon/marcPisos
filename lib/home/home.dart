import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _valorDigitado = TextEditingController();
  String _result;

  @override
  void initState() {
    super.initState();
    _result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Marc Pisos"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(60),
          width: double.infinity,
          height: double.infinity,
          color: Colors.deepPurple[100],
          child: SingleChildScrollView(
            child: Column(children: [
              formMedidas(),
              buildCalculateButton(),
            ]),
          ),
        ));
  }

  void calcular() {
    double valorDigitado = double.parse(_valorDigitado.text) * (1.15 * 3);
    int tamanho = valorDigitado.truncate().toString().length;
    setState(() {
      _result = valorDigitado.toStringAsPrecision(tamanho + 2);
    });
  }

  Widget buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _result,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildTextFormField(
      {TextEditingController controller, String error, String label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controller,
      validator: (text) {
        return text.isEmpty ? error : null;
      },
    );
  }

  Widget buildCalculateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: RaisedButton(
        onPressed: () => {calcular()},
        color: Colors.deepPurpleAccent,
        child: Text('Calcular', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Container formMedidas() {
    return Container(
        child: Column(children: [
      Row(
        children: [
          Expanded(
            child: buildTextFormField(
                label: "Preço M²", controller: _valorDigitado),
          ),
          Expanded(
            child: buildTextResult(),
          ),
        ],
      ),
    ]));
  }
}
