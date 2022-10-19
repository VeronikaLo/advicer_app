import 'dart:convert';
import 'package:advicer/domain/entities/advicer_entity.dart';
import 'package:http/http.dart' as http;
import '../models/advicer_model.dart';



abstract class AdvicerRemoteDatasource{
  Future<AdviceEntity> getRandomAdviceFromApi();

}


class AdvicerRemoteDatasourceImpl implements AdvicerRemoteDatasource{

  final http.Client client = http.Client();

  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async{
    
    final response = await client.get(
      Uri.parse("https://api.adviceslip.com/advice"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final responseBody = json.decode(response.body);

      return AdviceModel.fromJson(responseBody["slip"]);


  }

}