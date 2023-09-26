part of 'months_bloc.dart';

sealed class MonthsEvent extends Equatable {
  const MonthsEvent();
  @override
  List<Object?> get props => [];
}


class GetMonthsDataEvent extends MonthsEvent{
 const GetMonthsDataEvent({required this.monthNumber});
final int monthNumber;
  @override
  List<Object?> get props => [monthNumber];

}
