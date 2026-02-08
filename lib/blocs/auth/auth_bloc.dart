import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Eventos
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  AuthLoginRequested(this.email, this.password);
}

class AuthLogoutRequested extends AuthEvent {}

// Estados
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final String username;
  AuthAuthenticated(this.username);
}

class AuthUnauthenticated extends AuthState {}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthUnauthenticated()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1)); // Simula API
      
      if (event.email == 'admin' && event.password == '123') {
        emit(AuthAuthenticated('Administrador'));
      } else {
        emit(AuthUnauthenticated()); // Poderia ser um estado de Erro
      }
    });

    on<AuthLogoutRequested>((event, emit) {
      emit(AuthUnauthenticated());
    });
  }
}