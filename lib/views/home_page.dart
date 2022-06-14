import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gurme/modals/product_type.dart';
import 'package:gurme/modals/restoran.dart';
import 'package:gurme/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_choices/search_choices.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture:
                  Text('GURME', style: GoogleFonts.bebasNeue(fontSize: 30)),
              accountName: Text(UserService.user!.getFullName()),
              accountEmail:
                  Text(FirebaseAuth.instance.currentUser!.email.toString()),
            ),
            DrawerListTile(
              iconData: Icons.account_box_sharp,
              titleText: 'Profil',
              onTap: () {},
            ),
            DrawerListTile(
              iconData: Icons.comment_sharp,
              titleText: 'Değerlendirmelerim',
              onTap: () {},
            ),
            DrawerListTile(
              iconData: Icons.exit_to_app_sharp,
              titleText: 'Çıkış Yap',
              onTap: controller.logout,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        actions: [
          IconButton(
              onPressed: controller.getToSearchScreen,
              icon: Icon(Icons.search_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.height / 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Yakındaki Restorantlar',
                style: GoogleFonts.lobster(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                  itemExtent: 290,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return RestoranCard();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Mutfaklar',
                style: GoogleFonts.lobster(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.productTypes.length,
                  itemBuilder: (context, index) {
                    return ProductTypeCard(
                      productType: controller.productTypes[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTypeCard extends StatelessWidget {
  ProductType productType;
  ProductTypeCard({required this.productType});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 200,
              height: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.asset(
                  productType.imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                productType.name,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RestoranCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.network(
              'https://antalyacityzone.com/images/sehrini-tani/antalyanin-en-luks-7-restorani/501599655971.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Kardeşler Pide Kebap',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text('10 km'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text('Çankaya / Ankara'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  IconData iconData;
  String titleText;
  void Function()? onTap;

  DrawerListTile({required this.iconData, required this.titleText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        iconColor: Colors.deepOrange,
        textColor: Colors.deepOrange,
        tileColor: Theme.of(context).primaryColor,
        leading: Icon(iconData),
        title: Text(titleText),
        onTap: onTap,
      ),
    );
  }
}
