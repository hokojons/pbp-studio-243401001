String? periksaNim(String nim, {int tahunSekarang = 2026}) {
  if (nim.length != 7) {
    return 'NIM harus 7 angka, tetapi panjangnya ${nim.length}';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(nim)) {
    return 'NIM hanya boleh berisi angka, ditemukan: $nim';
  }
  final int tahun = int.parse(nim.substring(0, 4));
  if (tahun < 2015 || tahun > tahunSekarang) {
    return 'Tahun masuk $tahun di luar rentang 2015 sampai $tahunSekarang';
  }
  return null; // null = tidak ada galat, NIM sah
}

void main() {
  for (final String nim in ['2024001', '20240', '20A4001', '2010001']) {
    final String? galat = periksaNim(nim);
    print('$nim -> ${galat ?? "sah"}');
  }
}
