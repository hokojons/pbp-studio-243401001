final Map<String, int> _katalog = {
  'pensil': 2000,
  'buku': 15000,
  'pulpen': 3000,
};

Map<String, Object> tanganiPermintaan(Map<String, String> kueri) {
  final String? barang = kueri['barang'];
  if (barang == null || barang.trim().isEmpty) {
    return {'status': 400, 'pesan': 'Parameter barang wajib diisi'};
  }

  int jumlah = 1; // default kalau jumlah tidak dikirim
  final String? jumlahTeks = kueri['jumlah'];
  if (jumlahTeks != null) {
    final int? parsed = int.tryParse(jumlahTeks);
    if (parsed == null) {
      return {
        'status': 400,
        'pesan': 'Parameter jumlah harus angka, diberikan: $jumlahTeks',
      };
    }
    if (parsed < 1) {
      return {'status': 400, 'pesan': 'Parameter jumlah minimal 1'};
    }
    jumlah = parsed;
  }

  final int? harga = _katalog[barang];
  if (harga == null) {
    return {'status': 404, 'pesan': 'Barang tidak ditemukan: $barang'};
  }

  return {
    'status': 200,
    'barang': barang,
    'jumlah': jumlah,
    'total': harga * jumlah,
  };
}

void main() {
  final List<Map<String, String>> uji = [
    {},
    {'barang': '  '},
    {'barang': 'buku', 'jumlah': 'banyak'},
    {'barang': 'buku', 'jumlah': '0'},
    {'barang': 'laptop', 'jumlah': '2'},
    {'barang': 'buku', 'jumlah': '3'},
    {'barang': 'pensil'},
  ];
  for (final Map<String, String> k in uji) {
    print('$k -> ${tanganiPermintaan(k)}');
  }
}
