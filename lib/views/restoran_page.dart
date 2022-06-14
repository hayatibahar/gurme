import 'package:gurme/controllers/restoran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RestoranPage extends StatelessWidget {
  RestoranController controller = Get.put(RestoranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                Icons.favorite,
                color: controller.isFav.value ? Colors.red : Colors.white,
              ),
              onPressed: controller.onClickFav,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Image.network(
              'https://www.donanimhaber.com/images/images/haber/144438/1400x1050domino-s-pizza-da-veri-ihlali-180-bin-kisinin-verisi-sizdi.jpg',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Dominos Pizza İncek',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Gölbaşı / Ankara'),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Ürünler',
                style: GoogleFonts.sourceSansPro(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          ListView.builder(
              itemCount: 20,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: InkWell(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            'https://dwfdzxoxxagos.cloudfront.net/images/products/weblisteleme_efsane5li_bigpixel.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Karışık Pizza',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text('Lezzet : 5'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text('Sunum : 5'),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
