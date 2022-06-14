import 'package:gurme/controllers/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'restoran_page.dart';

class SearchPage extends StatelessWidget {
  SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Bir şeyler arayın  ',
            border: UnderlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
      ),
      body: Column(
        children: [
          Divider(
            thickness: 1,
            color: Colors.white60,
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Get.to(() => RestoranPage());
                },
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        'https://www.donanimhaber.com/images/images/haber/144438/1400x1050domino-s-pizza-da-veri-ihlali-180-bin-kisinin-verisi-sizdi.jpg',
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
                              'Dominos Pizza İncek',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Gölbaşı / Ankara',
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
        ],
      ),
    );
  }
}
