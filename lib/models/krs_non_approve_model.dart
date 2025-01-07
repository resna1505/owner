class KrsNonApproveModel {
  final String? approvalKey;
  final String? namaProdi;
  final String? angkatan;
  final String? id;
  final String? nama;
  final String? tanggal;
  final String? statusApproval;

  KrsNonApproveModel({
    this.approvalKey,
    this.namaProdi,
    this.angkatan,
    this.id,
    this.nama,
    this.tanggal,
    this.statusApproval,
  });

  factory KrsNonApproveModel.fromJson(Map<String, dynamic> json) =>
      KrsNonApproveModel(
        approvalKey: json['APPROVALKEY'],
        namaProdi: json['PRODI'],
        angkatan: json['ANGKATAN'],
        id: json['NIM'],
        nama: json['NAMAMHS'],
        tanggal: json['TANGGAL'],
        statusApproval: json['STATUSAPPROVAL'],
      );
}
