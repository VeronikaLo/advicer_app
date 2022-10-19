
import 'package:advicer/domain/entities/advicer_entity.dart';
import 'package:advicer/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

class AdvicerUsecases{

  Future<void> sleep (){
      return Future.delayed(const Duration(seconds: 2), ()=> '1');
    }

  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async{
    await sleep();
    return Right(AdviceEntity(advice: 'advice1', id: 1));
  }
}