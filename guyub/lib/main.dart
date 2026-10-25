import 'package:flutter/material.dart';

void main() {
  runApp(const GuyubApp());
}

class ItemBacklog {
  final String kunci;
  final String judul;
  final String jenis;
  final int poin;
  String status;
  final String? penanggungJawab;

  ItemBacklog({
    required this.kunci,
    required this.judul,
    required this.jenis,
    required this.poin,
    required this.status,
    this.penanggungJawab,
  });
}

final List<ItemBacklog> daftarBacklog = [
  ItemBacklog(
    kunci: 'GYB-001',
    judul: 'Halaman menu roti',
    jenis: 'story',
    poin: 5,
    status: 'Done',
    penanggungJawab: 'Sekar',
  ),
  ItemBacklog(
    kunci: 'GYB-002',
    judul: 'Form pesanan',
    jenis: 'story',
    poin: 5,
    status: 'Review',
    penanggungJawab: 'Bayu',
  ),
  ItemBacklog(
    kunci: 'GYB-003',
    judul: 'Tombol pesan tidak aktif di Safari',
    jenis: 'bug',
    poin: 2,
    status: 'In Progress',
    penanggungJawab: 'Dimas',
  ),
  ItemBacklog(
    kunci: 'GYB-004',
    judul: 'Ongkir dihitung per kecamatan',
    jenis: 'story',
    poin: 3,
    status: 'To Do',
    penanggungJawab: 'Bayu',
  ),
  ItemBacklog(
    kunci: 'GYB-005',
    judul: 'Foto produk lambat dimuat',
    jenis: 'bug',
    poin: 2,
    status: 'To Do',
    penanggungJawab: null,
  ),
];

class GuyubApp extends StatelessWidget {
  const GuyubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guyub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const DaftarKartuPage(),
    );
  }
}

class DaftarKartuPage extends StatefulWidget {
  const DaftarKartuPage({super.key});

  @override
  State<DaftarKartuPage> createState() => _DaftarKartuPageState();
}

class _DaftarKartuPageState extends State<DaftarKartuPage> {
  Color _warnaStatus(String status) {
    switch (status) {
      case 'To Do':
        return Colors.grey;
      case 'In Progress':
        return Colors.blue;
      case 'Review':
        return Colors.orange;
      case 'Done':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guyub - Backlog'),
      ),
      body: ListView.builder(
        itemCount: daftarBacklog.length,
        itemBuilder: (context, index) {
          final item = daftarBacklog[index];
          return ListTile(
            title: Text(item.judul),
            subtitle: Text('${item.kunci} | ${item.jenis} | ${item.poin} poin'),
            trailing: Text(
              item.status,
              style: TextStyle(color: _warnaStatus(item.status)),
            ),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailKartuPage(item: item),
                ),
              );
              setState(() {});
            },
          );
        },
      ),
    );
  }
}

class DetailKartuPage extends StatefulWidget {
  final ItemBacklog item;
  const DetailKartuPage({super.key, required this.item});

  @override
  State<DetailKartuPage> createState() => _DetailKartuPageState();
}

class _DetailKartuPageState extends State<DetailKartuPage> {
  static const _urutanStatus = ['To Do', 'In Progress', 'Review', 'Done'];

  void _majukanStatus() {
    final idx = _urutanStatus.indexOf(widget.item.status);
    if (idx < _urutanStatus.length - 1) {
      setState(() {
        widget.item.status = _urutanStatus[idx + 1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final bisaMaju = _urutanStatus.indexOf(item.status) < _urutanStatus.length - 1;
    final punyaPJ = item.penanggungJawab != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.kunci),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.judul, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            Text('Kunci: ${item.kunci}'),
            Text('Jenis: ${item.jenis}'),
            Text('Poin: ${item.poin}'),
            Text('Penanggung Jawab: ${item.penanggungJawab ?? "belum ada"}'),
            Text('Status: ${item.status}'),
            const Spacer(),
            if (!punyaPJ)
              const Text(
                'Kartu ini belum memiliki penanggung jawab. Status tidak dapat dimajukan.',
                style: TextStyle(color: Colors.red),
              ),
            if (punyaPJ)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: bisaMaju ? _majukanStatus : null,
                  child: Text(
                    bisaMaju
                        ? 'Majukan ke ${_urutanStatus[_urutanStatus.indexOf(item.status) + 1]}'
                        : 'Sudah Done',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
