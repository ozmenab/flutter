import 'package:dio/dio.dart';
import 'package:note_book/data/services/dio_manager.dart';
import 'package:note_book/data/services/register/model/register_request_model.dart';
import 'package:note_book/data/services/register/model/register_response_model.dart';

abstract class RegisterService {
  Future<RegisterResponseModel> register(
      RegisterRequestModel registerRequestModel);
}

class RegisterServiceImp extends RegisterService {
  final Dio _dio;
  RegisterServiceImp(DioManager _dioManager) : _dio = _dioManager.dio;

  @override
  Future<RegisterResponseModel> register(
      RegisterRequestModel registerRequestModel) {
    return _dio
        .post("notebook/register.php", data: registerRequestModel.toJson())
        .then((response) => registerResponseModelFromJson(response.data));
  }
}
