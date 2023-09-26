import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weeks_event.dart';
part 'weeks_state.dart';

class WeeksBloc extends Bloc<WeeksEvent, WeeksState> {
  WeeksBloc() : super(WeeksInitial()) {
    on<WeeksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
