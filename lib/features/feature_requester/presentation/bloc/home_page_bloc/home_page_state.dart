part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  final RequestStatus requestStatus;

  const HomePageState({required this.requestStatus});

  HomePageState copyWith({RequestStatus? newRequestStatus}) {
    return HomePageState(requestStatus: newRequestStatus ?? requestStatus);
  }

  @override
  List<Object?> get props => [requestStatus];
}
