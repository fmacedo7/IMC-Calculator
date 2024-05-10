import 'package:flutter/material.dart';

class ResultAndBackButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const ResultAndBackButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          elevation: 20,
          color: const Color.fromRGBO(27, 66, 66, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.done,
                color: Color.fromRGBO(158, 200, 185, 1),
              ),
              Text(
                buttonName,
                style: const TextStyle(
                  color: Color.fromRGBO(158, 200, 185, 1),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}