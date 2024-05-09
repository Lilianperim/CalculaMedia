import 'package:flutter/material.dart';

class NotaMedia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotaMediaState();
}

class _NotaMediaState extends State<NotaMedia> {
  static const Widget verticalSpaceSmall = SizedBox(height: 8.0);
  static const Widget verticalSpaceMedium = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Tarefa final D2DM1', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "CALCULADOR DE MÉDIA",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpaceMedium,
              _buildLabeledTextField('NOME'),
              _buildLabeledTextField('eMAIL'),
              _buildLabeledTextFieldSmall('Nota 1', 'Nota 2', 'Nota 3'),
              _buildButton(context, 'CALCULA MÉDIA', true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpaceSmall,
        TextField(
          decoration: _buildInputDecoration(hint),
        ),
        verticalSpaceMedium,
      ],
    );
  }

  Widget _buildLabeledTextFieldSmall(
      String label1, String label2, String label3) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 112,
          height: 112,
          child: TextField(
            decoration: _buildInputDecoration(label1),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 112,
          height: 112,
          child: TextField(
            decoration: _buildInputDecoration(label2),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 112,
          height: 112,
          child: TextField(
            decoration: _buildInputDecoration(label3),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: label,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.blue, width: 2.0),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, bool isFirstButton) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );
}
