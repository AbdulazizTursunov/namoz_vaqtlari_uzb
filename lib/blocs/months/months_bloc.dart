import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namoz_vaqtlari_uzb/repository/repository.dart';
import 'package:namoz_vaqtlari_uzb/service/api_service.dart';

import '../../model/enum_class.dart';
import '../../model/month/month_model.dart';

part 'months_event.dart';

part 'months_state.dart';

class MonthsBloc extends Bloc<MonthsEvent, MonthsState> {
  MonthsBloc({required ApiRepository apiRepository})
      : _apiRepository = apiRepository,
        super(const MonthsState()) {
    on<GetMonthsDataEvent>(_getMonthsDataEvent);
  }

  Future<void> _getMonthsDataEvent(
      GetMonthsDataEvent event, Emitter<MonthsState> emit) async {
    emit(state.copyWith(states: States.loading));
    try {
      final dynamic  monthData =
          await _apiRepository.getOylikNamozVaqtlari(event.monthNumber );
      emit(state.copyWith(states: States.success, monthData: monthData));
    } on UnknownException {
      emit(state.copyWith(states: States.failure, errorText: 'other error'));
    } on DioFailure catch (e) {
      emit(state.copyWith(
          states: States.failure, errorText: '${e.statusCode}\n${e.massage}'));
    }
  }

  final ApiRepository _apiRepository;
}
