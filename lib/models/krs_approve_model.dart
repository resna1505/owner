class KrsApproveModel {
  final String? namaProdi;
  final String? idProdi;
  final String? angkatan;
  final String? id;
  final String? nama;
  final String? tanggal;
  final String? tanggalapproval;
  final String? statusApproval;

  KrsApproveModel({
    this.namaProdi,
    this.idProdi,
    this.angkatan,
    this.id,
    this.nama,
    this.tanggal,
    this.statusApproval,
    this.tanggalapproval,
  });

  factory KrsApproveModel.fromJson(Map<String, dynamic> json) =>
      KrsApproveModel(
        namaProdi: json['PRODI'],
        idProdi: json['IDPRODI'],
        angkatan: json['ANGKATAN'],
        id: json['NIM'],
        nama: json['NAMAMHS'],
        tanggal: json['TANGGAL'],
        tanggalapproval: json['TGLAPPROVAL'],
        statusApproval: json['STATUSAPPROVAL'],
      );
}
