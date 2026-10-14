Map<String, int> bagiTagihan(
  int total,
  List<String> peserta,
  Map<String, int> diskonPersen,
) {
  final Map<String, int> bayar = {};
  if (peserta.isEmpty) return bayar;

  // Bobot = 100 - diskon (dibatasi 0..100).
  final Map<String, int> bobot = {};
  int totalBobot = 0;
  for (final String p in peserta) {
    int d = diskonPersen[p] ?? 0;
    if (d < 0) d = 0;
    if (d > 100) d = 100;
    bobot[p] = 100 - d;
    totalBobot += bobot[p] ?? 0;
  }
  // Semua diskon 100%: bobot jadi sama rata supaya tetap bisa dibagi.
  if (totalBobot == 0) {
    for (final String p in peserta) {
      bobot[p] = 1;
    }
    totalBobot = peserta.length;
  }

  int terbagi = 0;
  for (final String p in peserta) {
    final int bagian = total * (bobot[p] ?? 0) ~/ totalBobot;
    bayar[p] = bagian;
    terbagi += bagian;
  }

  // Sisa pembulatan (selalu kurang dari jumlah peserta) dibebankan kepada
  // peserta pertama di daftar: aturannya tetap dan bisa diprediksi, dan
  // selisihnya paling banyak beberapa rupiah sehingga tidak berarti.
  final int sisa = total - terbagi;
  final String pertama = peserta.first;
  bayar[pertama] = (bayar[pertama] ?? 0) + sisa;

  return bayar;
}

void main() {
  const int total = 100000;
  final List<String> peserta = ['Ani', 'Budi', 'Citra'];
  final Map<String, int> diskon = {'Budi': 50, 'Citra': 20};

  final Map<String, int> hasil = bagiTagihan(total, peserta, diskon);
  print(hasil);

  int jumlah = 0;
  for (final int v in hasil.values) {
    jumlah += v;
  }
  print('Jumlah bayaran: $jumlah, total: $total, sama: ${jumlah == total}');

  print(bagiTagihan(50000, [], {}));
}
