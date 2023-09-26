class TimesOyliknamozVaqtlari {
  String tongSaharlik;
  String quyosh;
  String peshin;
  String asr;
  String shomIftor;
  String hufton;

  TimesOyliknamozVaqtlari({
    required this.tongSaharlik,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shomIftor,
    required this.hufton,
  });
  TimesOyliknamozVaqtlari.initial():this(
    tongSaharlik:'',
    quyosh:'',
    peshin:'',
    asr:'',
    shomIftor:'',
    hufton:'',
  );

  TimesOyliknamozVaqtlari copyWith({
    String? tongSaharlik,
    String? quyosh,
    String? peshin,
    String? asr,
    String? shomIftor,
    String? hufton,
  }) =>
      TimesOyliknamozVaqtlari(
        tongSaharlik: tongSaharlik ?? this.tongSaharlik,
        quyosh: quyosh ?? this.quyosh,
        peshin: peshin ?? this.peshin,
        asr: asr ?? this.asr,
        shomIftor: shomIftor ?? this.shomIftor,
        hufton: hufton ?? this.hufton,
      );

  factory TimesOyliknamozVaqtlari.fromJson(Map<String, dynamic> json) => TimesOyliknamozVaqtlari(
    tongSaharlik: json['tong_saharlik'],
    quyosh: json['quyosh'],
    peshin: json['peshin'],
    asr: json['asr'],
    shomIftor: json['shom_iftor'],
    hufton: json['hufton'],
  );

  Map<String, dynamic> toJson() => {
    'tong_saharlik': tongSaharlik,
    'quyosh': quyosh,
    'peshin': peshin,
    'asr': asr,
    'shom_iftor': shomIftor,
    'hufton': hufton,
  };
}