import 'package:advicer/data/datasources/advicer_remote_datasourse.dart';
import 'package:dartz/dartz.dart';
import 'package:advicer/domain/failures/failure.dart';
import 'package:advicer/domain/entities/advicer_entity.dart';
import '../../domain/repositories/advicer_repository.dart';
import '../exceptions/exceptions.dart';

class AdvicerRepositoryImpl implements AdvicerRepository{

  final AdvicerRemoteDatasource advicerRemoteDatasource = AdvicerRemoteDatasourceImpl();

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromApi() async{

    try{
      final remoteAdvice = await advicerRemoteDatasource.getRandomAdviceFromApi();
      return Right(remoteAdvice);

    }catch(e){
      if(e.runtimeType is ServerException){
        return Left(ServerFailure());

      } else{
        return Left(GeneralFailure());
      }
      
    }
    

    
  }
  
}