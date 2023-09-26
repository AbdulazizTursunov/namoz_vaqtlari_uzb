import 'package:equatable/equatable.dart';

import 'month_time.dart';

class OyliknamozVaqtlari extends Equatable {
 const OyliknamozVaqtlari({
    required this.region,
    required this.month,
    required this.day,
    required this.weekday,
    required this.times,
  });

  const OyliknamozVaqtlari.initial()
      : this(
          region: '',
          month: 0,
          day: 0,
          weekday: '',
          times: null,
        );

  factory OyliknamozVaqtlari.fromJson(Map<String, dynamic> json) =>
      OyliknamozVaqtlari(
        region: json['region'],
        month: json['month'],
        day: json['day'],
        weekday: json['weekday'],
        times: TimesOyliknamozVaqtlari.fromJson(json['times']),
      );
  final String region;
  final int month;
  final int day;
  final String weekday;
  final TimesOyliknamozVaqtlari? times;

  OyliknamozVaqtlari copyWith({
    String? region,
    int? month,
    int? day,
    String? weekday,
    TimesOyliknamozVaqtlari? times,
  }) =>
      OyliknamozVaqtlari(
        region: region ?? this.region,
        month: month ?? this.month,
        day: day ?? this.day,
        weekday: weekday ?? this.weekday,
        times: times ?? this.times,
      );

  Map<String, dynamic> toJson() => {
        'region': region,
        'month': month,
        'day': day,
        'weekday': weekday,
        'times': times!.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        region,
        month,
        day,
        weekday,
        times,
      ];
}
