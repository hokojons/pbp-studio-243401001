Map<String, double> rataRataKelas(Map<String, List<int>> data) {
  final Map<String, double> hasil = {};
  for (final entri in data.entries) {
    final List<int> nilai = entri.value;
    if (nilai.isEmpty) {
      hasil[entri.key] = 0.0; // daftar kosong dianggap rata-rata 0
      continue;
    }
    int jumlah = 0;
    for (final int n in nilai) {
      jumlah += n;
    }
    hasil[entri.key] = jumlah / nilai.length;
  }
  return hasil;
}

// Mengembalikan null kalau Map kosong (tidak ada yang bisa dipilih).
String? namaTertinggi(Map<String, List<int>> data) {
  final Map<String, double> rata = rataRataKelas(data);
  String? terbaik;
  double skorTerbaik = 0;
  for (final entri in rata.entries) {
    if (terbaik == null || entri.value > skorTerbaik) {
      terbaik = entri.key;
      skorTerbaik = entri.value;
    }
  }
  return terbaik;
}

void main() {
  final Map<String, List<int>> kelas = {
    'Ani': [90, 85, 95],
    'Budi': [70, 65, 80],
    'Citra': [88, 92],
    'Dodi': [],
  };
  print(rataRataKelas(kelas));
  print('Tertinggi: ${namaTertinggi(kelas) ?? "tidak ada data"}');
  print(rataRataKelas({}));
  print('Tertinggi: ${namaTertinggi({}) ?? "tidak ada data"}');
}
