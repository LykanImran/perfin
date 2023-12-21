part of 'my_user_bloc.dart';

sealed class MyUserEvent extends Equatable {
  const MyUserEvent();

  @override
  List<Object> get props => [];
}

class MyUserReq extends MyUserEvent {
  final String email;

  const MyUserReq(
    this.email,
  );
}
