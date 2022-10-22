import 'package:advicer/data/datasources/advicer_remote_datasourse.dart';
import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/data/models/advicer_model.dart';
import 'package:advicer/data/repositories/advicer_repository_impl.dart';
import 'package:advicer/domain/entities/advicer_entity.dart';
import 'package:advicer/domain/failures/failure.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_repository_test.mocks.dart';

@GenerateMocks([AdvicerRemoteDatasource])
void main(){

  late AdvicerRepository advicerRepository;
  late MockAdvicerRemoteDatasource mockAdvicerRemoteDatasource;

  setUp((){
    mockAdvicerRemoteDatasource = MockAdvicerRemoteDatasource();
    advicerRepository = AdvicerRepositoryImpl(advicerRemoteDatasource: mockAdvicerRemoteDatasource);
  });

  group('getAdviceFromAPI', (){
      final t_AdviceModel = AdviceModel(advice: 'test', id: 1);
      final AdviceEntity t_advice = t_AdviceModel;

      test('should return remote data if the call to remote data source is successfull', ()async{
        //arrange
        when(mockAdvicerRemoteDatasource.getRandomAdviceFromApi()).thenAnswer((_) async => t_AdviceModel);

        //act
        final result = await advicerRepository.getAdviceFromApi();

        //assert
        verify(mockAdvicerRemoteDatasource.getRandomAdviceFromApi());
        verifyNoMoreInteractions(mockAdvicerRemoteDatasource);
        expect(result, Right(t_advice));
      });


      //2.Test
      test('should return server failure if data source throws a server exception', ()async{
        //arrange
        when(mockAdvicerRemoteDatasource.getRandomAdviceFromApi()).thenThrow(ServerException());

        //act
        final result = await advicerRepository.getAdviceFromApi();

        //assert
        verify(mockAdvicerRemoteDatasource.getRandomAdviceFromApi());
        verifyNoMoreInteractions(mockAdvicerRemoteDatasource);
        expect(result, Left(ServerFailure()));
      });
  });

}