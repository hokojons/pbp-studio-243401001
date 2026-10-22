List<String> tampilanKeranjang({
  required List<String> barang,
  required Map<String, int> harga,
  bool sedangMemuat = false,
  String? galat,
}) {
  // Urutan wajib: memuat -> galat -> kosong -> data.
  // Saat memuat, data belum datang sehingga `barang` pasti kosong; kalau
  // "kosong" diperiksa lebih dulu, pengguna keliru melihat "keranjang kosong"
  // padahal data hanya belum tiba. Begitu juga galat: daftar kosong akibat
  // gagal ambil data bukan berarti keranjangnya memang kosong.
  if (sedangMemuat) {
    return ['Sedang memuat keranjang...'];
  }
  if (galat != null) {
    return ['Terjadi galat: $galat', 'Silakan coba lagi.'];
  }
  if (barang.isEmpty) {
    return ['Keranjang kosong.', 'Ayo tambahkan barang pertama Anda.'];
  }
  final List<String> baris = [];
  int total = 0;
  for (final String b in barang) {
    final int h = harga[b] ?? 0;
    total += h;
    baris.add('$b: Rp$h');
  }
  baris.add('Total: Rp$total');
  return baris;
}

void main() {
  final Map<String, int> harga = {'pensil': 2000, 'buku': 15000};

  print('--- memuat ---');
  tampilanKeranjang(barang: [], harga: harga, sedangMemuat: true, galat: 'x')
      .forEach(print);

  print('--- galat ---');
  tampilanKeranjang(barang: ['buku'], harga: harga, galat: 'Koneksi putus')
      .forEach(print);

  print('--- kosong ---');
  tampilanKeranjang(barang: [], harga: harga).forEach(print);

  print('--- ada data ---');
  tampilanKeranjang(barang: ['pensil', 'buku', 'laptop'], harga: harga)
      .forEach(print);
}
