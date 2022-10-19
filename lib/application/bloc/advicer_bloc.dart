import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/advicer_entity.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerStateInitial()) {

    final usecases = AdvicerUsecases();

    on<AdviceGetEvent>((event, emit) async{
      // 1. State:
      emit(AdvicerStateLoading());
      
        //await sleep();
        AdviceEntity adviceFromUsecse = await usecases.getAdviceUsecase();
        emit(AdvicerStateLoaded(advice: adviceFromUsecse.advice));
  
    });

  }
}
