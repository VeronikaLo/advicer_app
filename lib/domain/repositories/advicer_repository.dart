
import 'package:advicer/domain/entities/advicer_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failure.dart';

abstract class AdvicerRepository{

  Future<Either<Failure, AdviceEntity>> getAdviceFromApi();
}