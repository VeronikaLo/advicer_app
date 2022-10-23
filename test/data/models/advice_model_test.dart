
import 'package:advicer/data/models/advicer_model.dart';
import 'package:advicer/domain/entities/advicer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  //weil wir keine dependency hier haben, brauchen wir kein setUp() und keine Zuweisung, wie machen sofort ein Test-Model

  final t_AdviceModel = AdviceModel(advice: 'test', id: 1);

  test('model should be subcluss of advice-entity ', (){
    //assert
    expect(t_AdviceModel, isA<AdviceEntity>());
  });

}