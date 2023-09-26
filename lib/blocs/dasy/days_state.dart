part of 'days_bloc.dart';

class DaysState extends Equatable {
   const DaysState({
    this.states = States.initial,
    this.errorText = '',
    this.dayData = const DailyPrayerTimes.initial(),
  });

  final States states;
  final DailyPrayerTimes dayData;
  final String errorText;


   DaysState copyWith({
     States? states,
     DailyPrayerTimes? dayData,
     String? errorText
   })=>  DaysState(
     states:  states ?? this.states,
     dayData:  dayData ?? this.dayData,
     errorText:  errorText ?? this.errorText,
   );


  @override
  List<Object?> get props => [states, dayData, errorText];
}


