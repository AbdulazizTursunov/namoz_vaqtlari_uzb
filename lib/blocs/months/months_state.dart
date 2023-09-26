part of 'months_bloc.dart';

class MonthsState extends Equatable {
  const MonthsState({
    this.states = States.initial,
    this.errorText = '',
    this.monthData = const [],
  });

  final String errorText;
  final States states;
  final List<OyliknamozVaqtlari> monthData;

  MonthsState copyWith({
    String? errorText,
    States? states,
    List<OyliknamozVaqtlari>? monthData,
  }) =>
      MonthsState(
        states: states ?? this.states,
        errorText: errorText ?? this.errorText,
        monthData: monthData ?? this.monthData,
      );

  @override
  List<Object?> get props => [
        states,
        errorText,
        monthData,
      ];
}
