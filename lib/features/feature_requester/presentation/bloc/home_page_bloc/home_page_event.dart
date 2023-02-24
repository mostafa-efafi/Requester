part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class SendRequestEvent extends HomePageEvent {
  final SentParam sentParam;

  const SendRequestEvent(this.sentParam);
}
