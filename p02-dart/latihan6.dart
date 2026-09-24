const katalog = <String, int>{
  'kopi': 8000,
  'teh': 5000,
  'jus': 12000,
  'roti': 7000,
};

String struk({
  required String pembeli,
  required List<String> pesanan,
  int diskonPersen = 0,
  int batasDiskon = 20000,
}) {
  int total = 0;
  List<String> tidakAda = [];

  for (var item in pesanan) {
    if (katalog.containsKey(item)) {
      total += katalog[item]!;
    } else {
      tidakAda.add(item);
    }
  }

  int potongan = 0;
  int persentaseTerpakai = 0;

  if (total >= batasDiskon && diskonPersen > 0) {
    persentaseTerpakai = diskonPersen;
    potongan = (total * diskonPersen) ~/ 100;
  }

  int dibayar = total - potongan;

  String output =
      '''
Struk untuk $pembeli
Jumlah barang : ${pesanan.length}
Total         : $total
Diskon        : $persentaseTerpakai persen, potongan $potongan
Dibayar       : $dibayar''';

  if (tidakAda.isNotEmpty) {
    output += 'Tidak ada di katalog: ${tidakAda.join(', ')}';
  }

  return output;
}

void main() {
  print(struk(pembeli: 'Andi', pesanan: ['teh', 'roti'], diskonPersen: 10));

  print(
    struk(pembeli: 'Budi', pesanan: ['kopi', 'jus', 'roti'], diskonPersen: 10),
  );

  print(
    struk(
      pembeli: 'Cindy',
      pesanan: ['kopi', 'roti', 'sate'],
      diskonPersen: 10,
    ),
  );
}
