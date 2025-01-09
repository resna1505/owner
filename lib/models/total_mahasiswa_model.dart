class TotalMahasiswaModel {
  final String? total;
  final String? aktif;
  final String? pria;
  final String? perempuan;

  TotalMahasiswaModel({
    this.total,
    this.aktif,
    this.pria,
    this.perempuan,
  });

  factory TotalMahasiswaModel.fromJson(Map<String, dynamic> json) =>
      TotalMahasiswaModel(
        total: json['TOTALMHS'],
        aktif: json['TOTALAKTIF'],
        pria: json['TOTALPRIAAKTIF'],
        perempuan: json['TOTALWANITAAKTIF'],
      );
}
