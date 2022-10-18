import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerStateInitial()) {

    Future<void> sleep (){
      return Future.delayed(const Duration(seconds: 2), ()=> '1');
    }

    on<AdviceGetEvent>((event, emit) async{
      // 1. State:
      emit(AdvicerStateLoading());
      
        await sleep();
        emit(AdvicerStateLoaded());
  
    });

  }
}
