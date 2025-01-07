class DiscountApproveModel {
  final String? namaProdi;
  final String? angkatan;
  final String? id;
  final String? nama;
  final String? komponen;
  final String? periode;
  final double? persenBeasiswa;
  final double? rupiahBeasiswa;
  final String? statusApproval;

  DiscountApproveModel({
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

  factory DiscountApproveModel.fromJson(Map<String, dynamic> json) =>
      DiscountApproveModel(
        namaProdi: json['NAMAPRODI'],
        angkatan: json['ANGKATAN'],
        id: json['ID'],
        nama: json['NAMA'],
        komponen: json['KOMPONEN'],
        periode: json['PERIODE'],
        persenBeasiswa: double.parse(json['PERSENDISKON'].toString()),
        rupiahBeasiswa: double.parse(json['RUPIAHDISKON'].toString()),
        statusApproval: json['STATUSAPPROVAL'],
      );
}
