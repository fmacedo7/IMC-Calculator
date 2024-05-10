import 'package:flutter/material.dart';
import 'package:imc/components/calculate_and_return_button.dart';
import 'package:imc/pages/calculate_imc.dart';

class ResultIMC extends StatelessWidget {
  final double imc;
  const ResultIMC({super.key, required this.imc});

  String getStatus(double imc) {
    if (imc < 18.5) {
      return "Magreza";
    } else if (imc >= 18.5 && imc <= 24.9) {
      return "Normal";
    } else if (imc >= 25 && imc <= 29.9) {
      return "Sobrepeso";
    } else if (imc >= 30) {
      return "Obesidade";
    }
    return "";
  }

  String getText(double imc) {
    if (imc < 18.5) {
      return "De acordo com a Organização Mundial da Saúde, seu IMC está abaixo "
          "do recomendado para a sua altura."
          "\nNota: o cálculo de IMC não leva em consideração a composição corporal. "
          "Por esse motivo, pessoas com muita massa muscular, como é o caso de "
          "alguns atletas, podem apresentar um IMC acima do normal. "
          "O ideal é consultar um nutricionista para fazer uma avaliação mais detalhada.";
    } else if (imc >= 18.5 && imc <= 24.9) {
      return "De acordo com a Organização Mundial da Saúde, "
          "seu IMC é considerado normal para a sua altura."
          "\nNota: o cálculo de IMC não leva em consideração a composição corporal. "
          "Por esse motivo, pessoas com muita massa muscular, como é o caso de "
          "alguns atletas, podem apresentar um IMC acima do normal. "
          "O ideal é consultar um nutricionista para fazer uma avaliação mais detalhada.";
    } else if (imc >= 25 && imc <= 29.9) {
      return "De acordo com a Organização Mundial da Saúde, seu IMC está "
          "acima do recomendado para a sua altura."
          "\nNota: o cálculo de IMC não leva em consideração a composição corporal. "
          "Por esse motivo, pessoas com muita massa muscular, como é o caso de "
          "alguns atletas, podem apresentar um IMC acima do normal. "
          "O ideal é consultar um nutricionista para fazer uma avaliação mais detalhada.";
    } else if (imc >= 30) {
      return "De acordo com a Organização Mundial da Saúde, seu IMC "
          "está acima do recomendado para a sua altura."
          "\nNota: o cálculo de IMC não leva em consideração a composição corporal. "
          "Por esse motivo, pessoas com muita massa muscular, como é o caso de "
          "alguns atletas, podem apresentar um IMC acima do normal. "
          "O ideal é consultar um nutricionista para fazer uma avaliação mais detalhada.";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    String status = getStatus(imc);
    String statusText = getText(imc);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(9, 38, 53, 1.0),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Resultado",
                      style: TextStyle(
                        color: Color.fromRGBO(158, 200, 185, 1),
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Column(
                            children: [
                              Text(
                                status,
                                style: const TextStyle(
                                  color: Color.fromRGBO(158, 200, 185, 1),
                                  fontSize: 30,
                                ),
                              ),
                              const Divider(
                                height: 0.6,
                                color: Color.fromRGBO(158, 200, 185, 1),
                                indent: 15,
                                endIndent: 15,
                              ),
                              Text(
                                "${imc.toStringAsFixed(1)} kg/m²",
                                style: const TextStyle(
                                  color: Color.fromRGBO(158, 200, 185, 1),
                                  fontSize: 42,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          statusText,
                          style: const TextStyle(
                            color: Color.fromRGBO(158, 200, 185, 1),
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ResultAndBackButton(
                      buttonName: ' Retornar',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CalculateIMC()));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
