import 'package:flutter/material.dart';
import 'package:myapp/screens/game_screen/utilities/game_manager.dart';

class ResultDialog extends StatefulWidget {
  const ResultDialog({super.key, required this.gameManager});
  final GameManager gameManager;

  @override
  State<ResultDialog> createState() => _ResultDialogState();
}

class _ResultDialogState extends State<ResultDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("점수: ${widget.gameManager.getScore()}"),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName("/"));
                },
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    widget.gameManager.resetStatus();
                  });
                },
                icon: Icon(Icons.restore),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
