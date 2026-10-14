double nilaiAkhir(double nts, double nas) => nts * 0.4 + nas * 0.6;

String huruf(double nilai) {
  // Batas: A >= 85, B >= 70, C >= 55, D >= 40, selain itu E
  if (nilai >= 85) return 'A';
  if (nilai >= 70) return 'B';
  if (nilai >= 55) return 'C';
  if (nilai >= 40) return 'D';
  return 'E';
}

void main() {
  final List<List<double>> uji = [
    [90, 90],
    [75, 70],
    [60, 55],
    [40, 45],
    [20, 30],
  ];
  for (final p in uji) {
    final double n = nilaiAkhir(p[0], p[1]);
    print('NTS ${p[0]}, NAS ${p[1]} -> $n -> ${huruf(n)}');
  }
}
