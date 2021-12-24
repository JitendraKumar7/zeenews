import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeenews/repository/repository.dart';

import 'event/detail_event.dart';
import 'state/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ApiRepository repository;

  DetailBloc(this.repository) : super(DetailInitial()) {
    on<FetchDetail>(_onChangeEvent);
  }

  void fetchDetail(String url) {
    add(FetchDetail(url));
  }

  void _onChangeEvent(DetailEvent event, Emitter<DetailState> emit) async {
    if (event is FetchDetail) {
      emit(DetailLoading());
      try {
        final String url = event.url;
        final detail = await repository.fetchDetail(url);
        emit(DetailLoaded(detail));
      } catch (e) {
        emit(DetailError(e.toString()));
      }
    }
  }
}
