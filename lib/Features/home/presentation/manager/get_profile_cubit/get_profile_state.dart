part of 'get_profile_cubit.dart';

abstract class GetProfileState {}

class GetProfileInitial extends GetProfileState {}
class GetProfileLoading extends GetProfileState {}
class GetProfileSuccess extends GetProfileState {
  final ProfileModel profileModel;

  GetProfileSuccess({required this.profileModel});

}
class GetProfileFailure extends GetProfileState {
  final String errMessage;

  GetProfileFailure({required this.errMessage});
}
