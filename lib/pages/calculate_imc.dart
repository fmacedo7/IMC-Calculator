import 'package:flutter/material.dart';
import 'package:imc/components/calculate_and_return_button.dart';
import 'package:imc/components/metrics_cards.dart';
import 'package:imc/pages/result_imc.dart';

class CalculateIMC extends StatefulWidget {
  const CalculateIMC({super.key});

  @override
  State<CalculateIMC> createState() => _CalculateIMCState();
}

class _CalculateIMCState extends State<CalculateIMC> {
  double weight = 0.0;
  double height = 0.0;
  double imc = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(9, 38, 53, 1.0),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    'Calculadora de IMC',
                    style: TextStyle(
                      color: Color.fromRGBO(158, 200, 185, 1),
                      fontSize: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PersonalCardMetrics(
                        cardHeight: 200,
                        titleCard: "Massa Corporal em Kilos",
                        personalMetrics: 'kg',
                        onValueChanged: (value) => {
                          setState(() {
                            weight = double.parse(value);
                            updateIMC();
                          }),
                        },
                      ),
                      PersonalCardMetrics(
                        cardHeight: 200,
                        titleCard: "Altura em Centímetros",
                        personalMetrics: "cm",
                        onValueChanged: (value) => {
                          setState(() {
                            height = double.parse(value);
                            updateIMC();
                          }),
                        },
                      ),
                    ],
                  ),
                ),
                ResultAndBackButton(
                  buttonName: " Calcular IMC",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultIMC(imc: imc,),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void updateIMC() {
    setState(() {
      imc = weight / ((height / 100) * (height / 100));
    });
  }
}