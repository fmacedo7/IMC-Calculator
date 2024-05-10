import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc/controller/counter_controller.dart';

class PersonalCardMetrics extends StatefulWidget {
  final String titleCard;
  final String personalMetrics;
  final double cardHeight;
  final ValueChanged<String>? onValueChanged;


  const PersonalCardMetrics({
    Key? key,
    required this.cardHeight,
    required this.titleCard,
    required this.personalMetrics,
    this.onValueChanged
  }) : super(key: key);

  @override
  State<PersonalCardMetrics> createState() => _PersonalCardMetricsState();
}

class _PersonalCardMetricsState extends State<PersonalCardMetrics> {
  CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    int counter = counterController.counter;
    String together = '$counter ${widget.personalMetrics}';

    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        elevation: 20,
        color: const Color.fromRGBO(27, 66, 66, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.titleCard,
              style: const TextStyle(
                color: Color.fromRGBO(158, 200, 185, 1),
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton.outlined(
                  onPressed: () {
                    setState(() {
                      counterController.decrement();
                      widget.onValueChanged?.call(counter.toString());
                    });
                  },
                    icon: const Icon(
                      Icons.remove,
                      color: Color.fromRGBO(158, 200, 185, 1),
                    ),
                ),
                Text(
                  together,
                  style: const TextStyle(
                      color: Color.fromRGBO(158, 200, 185, 1), fontSize: 42),
                ),
                IconButton.outlined(
                  onPressed: () {
                    setState(() {
                      counterController.increment();
                      widget.onValueChanged?.call(counter.toString());
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromRGBO(158, 200, 185, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
