final Map<String, int> katalog = {
  'pensil': 2000,
  'buku': 15000,
  'pulpen': 3000,
  'penghapus': 1500,
  'penggaris': 5000,
};

int hargaBarang(String nama) => katalog[nama] ?? 0;

int totalPesanan(List<String> pesanan) {
  int total = 0;
  for (final String p in pesanan) {
    total += katalog[p] ?? 0;
  }
  return total;
}

void main() {
  print(hargaBarang('buku'));
  print(hargaBarang('laptop'));
  print(totalPesanan(['pensil', 'buku', 'laptop', 'pulpen']));
  print(totalPesanan([]));
}
