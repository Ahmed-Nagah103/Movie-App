import 'package:movie_app_clean_arc/core/network/error_message_model.dart';

class ServerException  implements Exception{

ErrorMessageModel errorMessageModel;

ServerException({required this.errorMessageModel});
}