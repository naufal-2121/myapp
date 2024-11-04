import 'package:flutter/material.dart';
import '../models/coin.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cryptocurrency Prices'),
      ),
      body: FutureBuilder<List<Coin>>(
        future: apiService.fetchCoins(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          }

          List<Coin> coinList = snapshot.data!;
          return ListView.builder(
            itemCount: coinList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(coinList[index].image, width: 40, height: 40), // Menambahkan logo
                title: Text(coinList[index].name),
                subtitle: Text(coinList[index].symbol.toUpperCase()),
                trailing: Text('\$${coinList[index].currentPrice.toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(coin: coinList[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
