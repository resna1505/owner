class BeasiswaApproveModel {
  final String? namaProdi;
  final String? angkatan;
  final String? id;
  final String? nama;
  final String? komponen;
  final String? periode;
  final double? persenBeasiswa;
  final double? rupiahBeasiswa;
  final String? statusApproval;

  BeasiswaApproveModel({
    this.namaProdi,
    this.angkatan,
    this.id,
    this.nama,
    this.komponen,
    this.periode,
    this.persenBeasiswa,
    this.rupiahBeasiswa,
    this.statusApproval,
  });

  factory BeasiswaApproveModel.fromJson(Map<String, dynamic> json) =>
      BeasiswaApproveModel(
        namaProdi: json['NAMAPRODI'],
        angkatan: json['ANGKATAN'],
        id: json['ID'],
        nama: json['NAMA'],
        komponen: json['KOMPONEN'],
        periode: json['PERIODE'],
        persenBeasiswa: double.parse(json['PERSENBEASISWA'].toString()),
        rupiahBeasiswa: double.parse(json['RUPIAHBEASISWA'].toString()),
        statusApproval: json['STATUSAPPROVAL'],
      );
}
