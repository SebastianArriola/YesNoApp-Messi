import 'package:dio/dio.dart';
import 'package:flutter_application_2/domain/entities/message.dart';
import 'package:flutter_application_2/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async{
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    final message = Message(message: yesNoModel.answer == 'yes' ? 'Si' : 'No', fromWho: FromWho.person, urlImg: yesNoModel.image);

    return message;

  }

}