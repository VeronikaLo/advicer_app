import 'dart:convert';
import 'package:advicer/domain/entities/advicer_entity.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../exceptions/exceptions.dart';
import '../models/advicer_model.dart';



abstract class AdvicerRemoteDatasource{
  Future<AdviceEntity> getRandomAdviceFromApi();

}


class AdvicerRemoteDatasourceImpl implements AdvicerRemoteDatasource{

  //final http.Client client;
  final Dio dio;
  AdvicerRemoteDatasourceImpl({required this.dio});

  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async{
    try{
      final response = await dio.get(
      "https://api.adviceslip.com/advice"
          );
      final responseDecode = jsonDecode(response.data);
      //print(responseDecode);
      return AdviceModel.fromJson(responseDecode["slip"]);    
    }on DioError catch(e){
      //print(e.message);
      throw ServerException();
      
    }
    

    //final responseBody = json.decode(response.body);

    //  return AdviceModel.fromJson(responseBody["slip"]);
    // if (response.statusCode != 200) {
    //   throw ServerException();
    // } else {
    //   print(response.data);
    //   return AdviceModel.fromJson(response.data["slip"]);
    // }

  }

}