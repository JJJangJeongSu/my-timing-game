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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 20),
          Text(
            "점수: ${widget.gameManager.getScore()}",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            "최고 점수: ${13}",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Container(height:30),
          Text("완전 못해 ㅋㅋ", style: Theme.of(context).textTheme.displaySmall,),
          Container(height:20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName("/"));
                },
                icon: Icon(Icons.home, size: 50),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    widget.gameManager.resetStatus();
                  });
                },
                icon: Icon(Icons.replay, size: 50),
              ),
            ],
          ),
          Container(height: 20),
        ],
      ),
    );
  }
}
