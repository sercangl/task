import 'package:flutter/material.dart';

class GameDetailScreen extends StatelessWidget {
  final dynamic game;

  GameDetailScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(game['background_image']),
            SizedBox(height: 20),
            Text(
              game['name'],
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(game['description'] ??
                'No detailing description available only these ones'),
            Text('Released Date : ' + game['released']),
            Text('Ratings : ' +
                game['rating'].toString() +
                '/ ' +
                game['rating_top'].toString()),
          ],
        ),
      ),
    );
  }
}
