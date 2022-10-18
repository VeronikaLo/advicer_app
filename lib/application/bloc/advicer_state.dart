part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerState {}

class AdvicerStateInitial extends AdvicerState {}

class AdvicerStateLoading extends AdvicerState {}

class AdvicerStateLoaded extends AdvicerState {}

class AdvicerStateError extends AdvicerState {}
