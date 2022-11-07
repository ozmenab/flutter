import 'package:get/get.dart';
import 'package:note_book/data/services/dio_manager.dart';
import 'package:note_book/data/services/register/register_service.dart';
import 'package:note_book/views/add_notes/add_notes_controller.dart';
import 'package:note_book/views/home/home_controller.dart';
import 'package:note_book/views/login/login_controller.dart';
import 'package:note_book/views/register/register_controller.dart';

Future getControllers() async {
  //? Pages
  Get.create(() => LoginController(), permanent: false);
  Get.create(() => RegisterController(Get.find()), permanent: false);
  Get.create(() => HomeController(), permanent: false);
  Get.create(() => AddNotesController(), permanent: false);

//! Services
  Get.lazyPut(() => DioManager(), fenix: true);
  Get.lazyPut<RegisterService>(() => RegisterServiceImp(Get.find()));
}
