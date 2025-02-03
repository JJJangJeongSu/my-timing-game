import 'package:flutter/material.dart';

class ThemedButton extends StatelessWidget {
  const ThemedButton({
    super.key,
    required this.content,
    required this.screen,
    required this.context,
  });
  final String content;
  final Widget screen;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        shadowColor: Colors.grey,
        elevation: 5,
        textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Text(content),
    );
  }
}
