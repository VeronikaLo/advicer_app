
import 'package:advicer/domain/entities/advicer_entity.dart';

class AdvicerUsecases{

  Future<void> sleep (){
      return Future.delayed(const Duration(seconds: 2), ()=> '1');
    }

  Future<AdviceEntity> getAdviceUsecase() async{
    await sleep();
    return AdviceEntity(advice: 'advice1', id: 1);
  }
}