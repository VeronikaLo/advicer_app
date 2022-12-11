import 'dart:convert';
import 'package:advicer/domain/entities/advicer_entity.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../exceptions/exceptions.dart';
import '../models/advicer_model.dart';



abstract class AdvicerRemoteDatasource{
  Future<AdviceEntity> getRandomAdviceFromApi();

}


class AdvicerRemoteDatasourceImpl implements AdvicerRemoteDatasource{

  final http.Client client;
  AdvicerRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async{
    final response = await client.get(
      Uri.parse("https://api.adviceslip.com/advice"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);

      return AdviceModel.fromJson(responseBody["slip"]);
    }

  }

}