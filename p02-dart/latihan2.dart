int total(int harga, int jumlah) {
  return harga * jumlah;
}

int totalArrow(int harga, int jumlah) => harga * jumlah;

void main() {
  print('Total belanja: ${total(8000, 3)}');
}
