class DiscountApproveModel {
  final String? namaProdi;
  final String? idProdi;
  final String? angkatan;
  final String? id;
  final String? nama;
  final String? komponen;
  final String? periode;
  final double? persenBeasiswa;
  final double? rupiahBeasiswa;
  final String? statusApproval;
  final String? tanggalapproval;

  DiscountApproveModel({
    this.namaProdi,
    this.idProdi,
    this.angkatan,
    this.id,
    this.nama,
    this.komponen,
    this.periode,
    this.persenBeasiswa,
    this.rupiahBeasiswa,
    this.statusApproval,
    this.tanggalapproval,
  });

  factory DiscountApproveModel.fromJson(Map<String, dynamic> json) =>
      DiscountApproveModel(
        namaProdi: json['NAMAPRODI'],
        idProdi: json['IDPRODI'],
        angkatan: json['ANGKATAN'],
        id: json['ID'],
        nama: json['NAMA'],
        komponen: json['KOMPONEN'],
        periode: json['PERIODE'],
        persenBeasiswa: double.parse(json['PERSENDISKON'].toString()),
        rupiahBeasiswa: double.parse(json['RUPIAHDISKON'].toString()),
        statusApproval: json['STATUSAPPROVAL'],
        tanggalapproval: json['TGLAPPROVAL'],
      );
}
