class KeuanganAkademikModel {
  final String? total;
  final String? tahun;

  KeuanganAkademikModel({
    this.total,
    this.tahun,
  });

  factory KeuanganAkademikModel.fromJson(Map<String, dynamic> json) =>
      KeuanganAkademikModel(
        total: json['TOTALPENDAPATAN'],
        tahun: json['TAHUN'],
      );
}
