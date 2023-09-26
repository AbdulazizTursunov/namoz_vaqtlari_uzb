class TimesHaftaliknamozvaqtlari {

  TimesHaftaliknamozvaqtlari({
    required this.tongSaharlik,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shomIftor,
    required this.hufton,
  });

  TimesHaftaliknamozvaqtlari.initial():this(
    tongSaharlik:'',
    quyosh:'',
    peshin:'',
    asr:'',
    shomIftor:'',
    hufton:'',
  );

  factory TimesHaftaliknamozvaqtlari.fromJson(Map<String, dynamic> json) => TimesHaftaliknamozvaqtlari(
    tongSaharlik: json['tong_saharlik'],
    quyosh: json['quyosh'],
    peshin: json['peshin'],
    asr: json['asr'],
    shomIftor: json['shom_iftor'],
    hufton: json['hufton'],
  );
  String tongSaharlik;
  String quyosh;
  String peshin;
  String asr;
  String shomIftor;
  String hufton;

  Map<String, dynamic> toJson() => {
    'tong_saharlik': tongSaharlik,
    'quyosh': quyosh,
    'peshin': peshin,
    'asr': asr,
    'shom_iftor': shomIftor,
    'hufton': hufton,
  };
}