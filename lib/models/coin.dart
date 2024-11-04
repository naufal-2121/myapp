class Coin {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;
  final String image; // Menambahkan properti untuk URL gambar

  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.image,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      currentPrice: json['current_price'].toDouble(),
      image: json['image'], // Mendapatkan URL gambar dari JSON
    );
  }
}
