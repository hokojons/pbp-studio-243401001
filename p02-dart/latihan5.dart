String rangkum({required String nama, int diskon = 0, String? catatan}) {
  String teks = '$nama mendapat diskon $diskon persen';
  if (catatan != null) {
    teks += '. Catatan: $catatan';
  }
  return teks;
}

void main() {
  print(rangkum(nama: 'Andi'));
  print(rangkum(nama: 'Budi', diskon: 10));
  print(rangkum(nama: 'Cindy', diskon: 25, catatan: 'pelanggan tetap'));
}
//.dart_tool/dartpad/latihan4.dart:1:24: Error: The parameter 'nama' can't have a value of 'null' because of its type 'String', but the implicit default value is 'null'.
//latihan4.dart:1
//Try adding either an explicit non-'null' default value or the 'required' modifier.
//String rangkum({String nama, int diskon = 0, String? catatan}) {
