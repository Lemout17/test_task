part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({required this.user, required this.userSettings});

  final UserSettingsModel userSettings;
  final UserModel user;

  @override
  List<Object?> get props => [userSettings, user];

  AppState copyWith({
    required UserSettingsModel userSettings,
    required UserModel user,
  }) {
    return AppState(user: user, userSettings: userSettings);
  }
}
