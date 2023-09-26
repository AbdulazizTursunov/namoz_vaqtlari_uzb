import 'package:equatable/equatable.dart';
import 'package:namoz_vaqtlari_uzb/model/week/time_week_model.dart';

class Haftaliknamozvaqtlari extends Equatable {
  const Haftaliknamozvaqtlari({
    required this.region,
    required this.date,
    required this.weekday,
    required this.times,
  });

  Haftaliknamozvaqtlari.initial()
      : this(
          region: '',
          date: '',
          weekday: '',
          times: TimesHaftaliknamozvaqtlari.initial(),
        );

  factory Haftaliknamozvaqtlari.fromJson(Map<String, dynamic> json) =>
      Haftaliknamozvaqtlari(
        region: json['region'],
        date: json['date'],
        weekday: json['weekday'],
        times: TimesHaftaliknamozvaqtlari.fromJson(json['times']),
      );

  final String region;
  final String? date;
  final String weekday;
  final TimesHaftaliknamozvaqtlari? times;

  Map<String, dynamic> toJson() => {
        'region': region,
        'date': date,
        'weekday': weekday,
        'times': times!.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        region,
        date,
        weekday,
        times,
      ];
}
