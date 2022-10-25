
//import 'package:advicer/data/repositories/advicer_repository_impl.dart';
import 'package:advicer/domain/entities/advicer_entity.dart';
import 'package:advicer/domain/failures/failure.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:dartz/dartz.dart';

class AdvicerUsecases{

  final AdvicerRepository advicerRepository;
  AdvicerUsecases({required this. advicerRepository});

  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async{
    return advicerRepository.getAdviceFromApi();
    
  }
}