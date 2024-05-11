class ModelSejarawan {
  ModelSejarawan({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  late final bool isSuccess;
  late final String message;
  late final List<Datum> data;

  ModelSejarawan.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Datum.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isSuccess'] = isSuccess;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Datum {
  Datum({
    required this.id,
    required this.nama,
    required this.foto,
    required this.tanggal_lahir,
    required this.asal,
    required this.jenis_kelamin,
    required this.deskripsi,
  });

  late final String id;
  late final String nama;
  late final String foto;
  late final String tanggal_lahir;
  late final String asal;
  late final String jenis_kelamin;
  late final String deskripsi;

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    foto = json['foto'];
    tanggal_lahir = json['tanggal_lahir'];
    asal = json['asal'];
    jenis_kelamin = json['jenis_kelamin'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nama'] = nama;
    _data['foto'] = foto;
    _data['tanggal_lahir'] = tanggal_lahir;
    _data['asal'] = asal;
    _data['jenis_kelamin'] = jenis_kelamin;
    _data['deskripsi'] = deskripsi;
    return _data;
  }
}
