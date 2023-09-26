import 'package:equatable/equatable.dart';
import 'package:namoz_vaqtlari_uzb/model/day/time_day_model.dart';

class DailyPrayerTimes extends Equatable{

  const DailyPrayerTimes({
    required this.region,
    required this.date,
    required this.times,
    required this.weekday,
  });

  const DailyPrayerTimes.initial():this(
      region: '',
      date: null,
      times: null,
      weekday:''
  );

  factory DailyPrayerTimes.fromJson(Map<String, dynamic> json) =>
      DailyPrayerTimes(
        region: json['region'],
        date: DateTime.parse(json['date']),
        weekday: json['weekday'],
        times: TimesDailyPrayerTimes.fromJson(json['times']),
      );


  final String region;
  final DateTime? date;
  final String weekday;
  final TimesDailyPrayerTimes? times;

  Map<String, dynamic> toJson() => {
        'region': region,
        'date':
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        'weekday': weekday,
        'times': times?.toJson(),
      };

  @override
  List<Object?> get props => [
    region,
    date,
    times,
    weekday,
  ];
}
