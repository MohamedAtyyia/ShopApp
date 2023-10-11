part of 'localization_cubit.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();

  @override
  List<Object> get props => [];
}

final class LocalizationInitial extends LocalizationState {}

final class LanguageIsArabic extends LocalizationState {}

final class LanguageIsEnglisgh extends LocalizationState {}
final class ChangeState extends LocalizationState {}

final class StopLaoding extends LocalizationState {}

final class StartLaoding extends LocalizationState {}
