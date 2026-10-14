String kartu({
  required String nama,
  required int nilai,
  String? catatan,
  bool tampilkanNilai = true,
}) {
  final String bagianNilai = tampilkanNilai ? ' | nilai: $nilai' : '';
  final String bagianCatatan =
      (catatan != null && catatan.isNotEmpty) ? ' | catatan: $catatan' : '';
  return '$nama$bagianNilai$bagianCatatan';
}

void main() {
  print(kartu(nama: 'Ani', nilai: 90));
  print(kartu(nama: 'Budi', nilai: 75, catatan: 'Perlu remedial'));
  print(kartu(nama: 'Citra', nilai: 80, tampilkanNilai: false));
  print(kartu(
      nama: 'Dodi', nilai: 60, catatan: 'Rajin', tampilkanNilai: false));
}
