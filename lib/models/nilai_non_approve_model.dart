class NilaiNonApproveModel {
  final String? approvalKey;
  final String? namaProdi;
  final String? id;
  final String? nama;
  final String? tanggal;
  final String? statusApproval;
  final String? simbolAwal;
  final String? simbolAkhir;
  final String? idProdi;

  NilaiNonApproveModel({
    this.approvalKey,
    this.namaProdi,
    this.id,
    this.nama,
    this.tanggal,
    this.statusApproval,
    this.simbolAwal,
    this.simbolAkhir,
    this.idProdi,
  });

  factory NilaiNonApproveModel.fromJson(Map<String, dynamic> json) =>
      NilaiNonApproveModel(
        approvalKey: json['APPROVALKEY'],
        tanggal: json['TANGGAL'],
        idProdi: json['IDPRODI'],
        namaProdi: json['PRODI'],
        id: json['NIM'],
        nama: json['NAMAMHS'],
        simbolAwal: json['SIMBOLAWAL'],
        simbolAkhir: json['SIMBOLAKHIR'],
        statusApproval: json['STATUSAPPROVAL'],
      );
}
