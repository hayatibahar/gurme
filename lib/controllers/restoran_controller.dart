import 'package:get/get.dart';

class RestoranController extends GetxController {
  RxBool isFav = RxBool(false);

  void onClickFav() {
    isFav.value = !isFav.value;
    isFav.value.printInfo();
  }
}
