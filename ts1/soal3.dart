Map<String, double> statistik(List<int> data) {
  // Daftar kosong: semua 0 agar pemanggil tidak perlu menangani null.
  if (data.isEmpty) {
    return {'tertinggi': 0, 'terendah': 0, 'rataRata': 0};
  }
  int tinggi = data.first;
  int rendah = data.first;
  int jumlah = 0;
  for (final int x in data) {
    if (x > tinggi) tinggi = x;
    if (x < rendah) rendah = x;
    jumlah += x;
  }
  return {
    'tertinggi': tinggi.toDouble(),
    'terendah': rendah.toDouble(),
    'rataRata': jumlah / data.length,
  };
}

void main() {
  print(statistik([70, 85, 90, 60, 75]));
  print(statistik([]));
}
