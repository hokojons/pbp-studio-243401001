final Map<String, int> harga = {'kopi': 8000, 'teh': 5000, 'jus': 12000};

int cariHarga(Map<String, int> daftar, String nama) {
  return daftar[nama] ?? 0;
}

void main() {
  print('Harga kopi: ${cariHarga(harga, 'kopi')}');
  print('Harga susu: ${cariHarga(harga, 'susu')}');
}

//map itu adalah semacam folder yang mengumpulkan semua key-value pair
//Setiap nilai (value) disimpan dan diakses menggunakan kuncinya (key), bukan melalui indeks angka
//Karena key yang dicari belum tentu ada di dalam Map. Jika key (misalnya 'susu') tidak ditemukan, Map akan mengembalikan null
