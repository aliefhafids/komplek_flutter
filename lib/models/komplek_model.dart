class Komplek {
  final int id;
  final String kode;
  final String namaKomplek;

  const Komplek({
    required this.id,
    required this.kode,
    required this.namaKomplek
  });

  factory Komplek.fromJson(Map < String, dynamic > json) {
    return Komplek(
      id: json['id'],
      kode: json['kode'],
      namaKomplek: json['nama_komplek'],
    );
  }
}
