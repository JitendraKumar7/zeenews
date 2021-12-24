import 'package:equatable/equatable.dart';
import 'package:zeenews/modal/modal.dart';

abstract class DetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailLoading extends DetailState {}

class DetailInitial extends DetailState {}

class DetailLoaded extends DetailState {
  final DetailModal detail;

  DetailLoaded(this.detail);

  @override
  List<Object> get props => [detail];
}

class DetailError extends DetailState {
  final String error;

  DetailError(this.error);
}
