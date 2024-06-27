import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:{{name}}/models/user.dart';
import 'package:{{name}}/repositories/auth_repository.dart';
import 'package:{{name}}/repositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  AuthenticationBloc(this.userRepository, this.authRepository)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SigninUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));

      try {
        final user = await authRepository.login();

        if (user == true) {
          emit(AuthenticationSuccessState(userRepository.userDataModel));
        } else {
          emit(AuthenticationFailureState("Error in Login"));
        }
      } on Exception catch (e) {
        emit(AuthenticationFailureState(e.toString()));
      }

      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}
