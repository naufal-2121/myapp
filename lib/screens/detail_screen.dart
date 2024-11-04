import 'package:flutter/material.dart';
import '../models/coin.dart';

class DetailScreen extends StatelessWidget {
  final Coin coin;

  DetailScreen({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coin.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(coin.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Symbol: ${coin.symbol.toUpperCase()}'),
            SizedBox(height: 8),
            Text('Current Price: \$${coin.currentPrice.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
