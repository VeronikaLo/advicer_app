// ignore_for_file: constant_identifier_names

import 'package:advicer/domain/failures/failure.dart';
import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/advicer_entity.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';


const GENERAL_FAILURE_MESSAGE = "Ups, something went wrong. Please try again!";
const SERVER_FAILURE_MESSAGE = "Ups, Server Error. please try again!";

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerStateInitial()) {

    final usecases = AdvicerUsecases();

    on<AdviceGetEvent>((event, emit) async{
      // 1. State:
      emit(AdvicerStateLoading());
      
      Either<Failure, AdviceEntity> adviceOrFailure = await usecases.getAdviceUsecase();

      adviceOrFailure.fold(
        (failure) => emit(AdvicerStateError(message: _mapFailureToMessage(failure))), 
        (advice) => emit(AdvicerStateLoaded(advice: advice.advice))
        );
        
  
    });
  }

  // function to get a failure-message
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case GeneralFailure:
        return GENERAL_FAILURE_MESSAGE;

      default:
        return GENERAL_FAILURE_MESSAGE;
    }
  }
}
