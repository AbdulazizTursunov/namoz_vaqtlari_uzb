import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namoz_vaqtlari_uzb/repository/repository.dart';
import 'package:namoz_vaqtlari_uzb/service/api_service.dart';

import '../../model/day/day_model.dart';
import '../../model/enum_class.dart';

part 'days_event.dart';

part 'days_state.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {
  DaysBloc({required ApiRepository apiRepository})
      : _apiRepository = apiRepository,
        super(const DaysState()) {
    on<GetDaysEvent>(_getDaysEvent);
  }

  Future<void> _getDaysEvent(
      GetDaysEvent event, Emitter<DaysState> emit) async {
    emit(state.copyWith(states: States.loading));
    try {
      final DailyPrayerTimes data =
          await _apiRepository.getDailyPrayerTimes(event.region);
      emit(state.copyWith(states: States.success, dayData: data));
    } on UnknownException {
      emit(state.copyWith(states: States.failure, errorText: 'other error'));
    } on DioFailure catch (e) {
      emit(state.copyWith(
          states: States.failure, errorText: '${e.massage}\n${e.statusCode}'));
    }
  }

  final ApiRepository _apiRepository;
}
