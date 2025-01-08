class NilaiApproveModel {
  final String? namaProdi;
  final String? angkatan;
  final String? id;
  final String? nama;
  final String? tanggal;
  final String? tanggalapproval;
  final String? statusApproval;

  NilaiApproveModel({
    this.namaProdi,
    this.angkatan,
    this.id,
    this.nama,
    this.tanggal,
    this.statusApproval,
    this.tanggalapproval,
  });

  factory NilaiApproveModel.fromJson(Map<String, dynamic> json) =>
      NilaiApproveModel(
        namaProdi: json['PRODI'],
        angkatan: json['ANGKATAN'],
        id: json['NIM'],
        nama: json['NAMAMHS'],
        tanggal: json['TANGGAL'],
        tanggalapproval: json['TGLAPPROVAL'],
        statusApproval: json['STATUSAPPROVAL'],
      );
}
