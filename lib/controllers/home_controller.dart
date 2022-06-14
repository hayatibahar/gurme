import 'package:firebase_auth/firebase_auth.dart';
import 'package:gurme/modals/product_type.dart';
import 'package:gurme/services/firestore_service.dart';
import 'package:gurme/services/restoran_service.dart';
import 'package:gurme/services/user_service.dart';
import 'package:gurme/views/login_page.dart';
import 'package:gurme/views/search_page.dart';
import 'package:get/get.dart';

import '../modals/restoran.dart';

class HomeController extends GetxController {
  List<ProductType> productTypes = [
    ProductType(name: 'Pide / Lahmacun', imagePath: 'assets/images/pide.jpeg'),
    ProductType(name: 'Köfte', imagePath: 'assets/images/kofte.jpeg'),
    ProductType(
        name: 'Ev Yemekleri', imagePath: 'assets/images/ev_yemekleri.jpeg'),
    ProductType(
        name: 'Tost / Sandviç', imagePath: 'assets/images/tost_sandvic.jpeg'),
    ProductType(name: 'Tatlı', imagePath: 'assets/images/tatli.jpeg'),
    ProductType(name: 'Döner', imagePath: 'assets/images/doner.jpeg'),
    ProductType(
        name: 'Deniz Ürünleri', imagePath: 'assets/images/deniz_urunleri.jpeg'),
    ProductType(name: 'Steak', imagePath: 'assets/images/steak.jpeg'),
    ProductType(name: 'Tavuk', imagePath: 'assets/images/tavuk.jpeg'),
    ProductType(name: 'Pizza', imagePath: 'assets/images/pizza.jpeg'),
    ProductType(name: 'Burger', imagePath: 'assets/images/burger.jpeg'),
    ProductType(name: 'Kahvaltı', imagePath: 'assets/images/kahvalti.jpeg'),
    ProductType(
        name: 'Mantı / Makarna', imagePath: 'assets/images/makarna.jpeg'),
    ProductType(name: 'Kahve / İçecek', imagePath: 'assets/images/kahve.jpeg'),
  ];

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    print(FirebaseAuth.instance.currentUser?.email);
    Get.to(() => LoginPage());
  }

  Future test() async {
    RestoranService.restorans = await FirestoreService.getRestorans();
    for (Restoran restoran in RestoranService.restorans!) {
      print(restoran.name);
      print(restoran.district);
      print(restoran.city);
      print(restoran.geoPoint.longitude);
      print(restoran.geoPoint.latitude);
      print(restoran.imageUrl);
    }
  }

  void getToSearchScreen() {
    Get.to(() => SearchPage());
  }
}
