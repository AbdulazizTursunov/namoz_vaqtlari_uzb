import 'package:equatable/equatable.dart';

class TimesDailyPrayerTimes extends Equatable {
 const TimesDailyPrayerTimes({
    required this.tongSaharlik,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shomIftor,
    required this.hufton,
  });

 const TimesDailyPrayerTimes.initial()
      : this(
          tongSaharlik: '',
          quyosh: '',
          peshin: '',
          asr: '',
          shomIftor: '',
          hufton: '',
        );

  factory TimesDailyPrayerTimes.fromJson(Map<String, dynamic> json) =>
      TimesDailyPrayerTimes(
        tongSaharlik: json['tong_saharlik'],
        quyosh: json['quyosh'],
        peshin: json['peshin'],
        asr: json['asr'],
        shomIftor: json['shom_iftor'],
        hufton: json['hufton'],
      );
  final String tongSaharlik;
  final String quyosh;
  final String peshin;
  final String asr;
  final String shomIftor;
  final String hufton;

  Map<String, dynamic> toJson() => {
        'tong_saharlik': tongSaharlik,
        'quyosh': quyosh,
        'peshin': peshin,
        'asr': asr,
        'shom_iftor': shomIftor,
        'hufton': hufton,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        tongSaharlik,
        quyosh,
        peshin,
        asr,
        shomIftor,
        hufton,
      ];
}
