import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class FetchDetail extends DetailEvent {
  final String url;
  const FetchDetail(this.url);

  @override
  List<Object> get props => [];
}
