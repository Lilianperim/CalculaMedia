import 'package:flutter/material.dart';

class GradeMedia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GradeMediaState();
}

class _GradeMediaState extends State<GradeMedia> {
  static const Widget verticalSpaceSmall = SizedBox(height: 8.0);
  static const Widget verticalSpaceMedium = SizedBox(height: 10);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController gradeOneController = TextEditingController();
  final TextEditingController gradeTwoController = TextEditingController();
  final TextEditingController gradeThreeController = TextEditingController();

  String name = '';
  String email = '';
  String grade = '';
  double media = 0;

  void calculateMedia() {
    double n1 = double.tryParse(gradeOneController.text) ?? 0;
    double n2 = double.tryParse(gradeTwoController.text) ?? 0;
    double n3 = double.tryParse(gradeThreeController.text) ?? 0;
    setState(() {
      name = nameController.text;
      email = emailController.text;
      grade =
          '${gradeOneController.text} / ${gradeTwoController.text} / ${gradeThreeController.text}';
      media = (n1 + n2 + n3) / 3;
    });
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    gradeOneController.clear();
    gradeTwoController.clear();
    gradeThreeController.clear();

    setState(() {
      name = '';
      email = '';
      grade = '';
      media = 0;
    });
  }

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalSpaceSmall,
                  TextField(
                    controller: nameController,
                    decoration: _buildInputDecoration('NOME'),
                  ),
                  verticalSpaceMedium,
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalSpaceSmall,
                  TextField(
                    controller: emailController,
                    decoration: _buildInputDecoration('eMAIL'),
                  ),
                  verticalSpaceMedium,
                ],
              ),
              _buildLabeledTextFieldSmall('Nota 1', 'Nota 2', 'Nota 3'),
              _buildButtonCalculate('CALCULA MÉDIA'),
              verticalSpaceMedium,
              Text('Resultado:'),
              Text('Nome: $name'),
              Text('Email: $email'),
              Text('Notas: $grade'),
              Text('Média: ${media.toStringAsFixed(2)}'),
              verticalSpaceMedium,
              _buildButtonDeleteFields("APAGAR"),
            ],
          ),
        ),
      ),
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
            controller: gradeOneController,
            decoration: _buildInputDecoration(label1),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 112,
          height: 112,
          child: TextField(
            controller: gradeTwoController,
            decoration: _buildInputDecoration(label2),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 112,
          height: 112,
          child: TextField(
            controller: gradeThreeController,
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
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    );
  }

  Widget _buildButtonCalculate(String label) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: calculateMedia,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildButtonDeleteFields(String label) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: clearFields,
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
