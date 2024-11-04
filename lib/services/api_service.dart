import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/coin.dart';

class ApiService {
  final String baseUrl = "https://api.coingecko.com/api/v3/coins/markets";

  Future<List<Coin>> fetchCoins() async {
    final response = await http.get(Uri.parse('$baseUrl?vs_currency=usd'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Coin.fromJson(data)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
