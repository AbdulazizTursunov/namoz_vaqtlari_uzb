part of 'days_bloc.dart';

sealed  class DaysEvent extends Equatable {
  const DaysEvent();
  @override
  List<Object?> get props => [];
}

final class GetDaysEvent extends DaysEvent{
 const GetDaysEvent({required this.region});
 final String region;
 @override
 List<Object?> get props => [region];
}
