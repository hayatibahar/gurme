import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../modals/restoran.dart';
import '../modals/user.dart';

class FirestoreService {
  static Future<FirebaseUser> getUser(User user) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .limit(1)
        .where('email', isEqualTo: user.email)
        .get();
    for (var doc in querySnapshot.docs) {
      return FirebaseUser(
          name: doc.get('name'),
          surname: doc.get('surname'),
          email: doc.get('email'));
    }
    throw Exception('Kullanıcı kayıtlı değil');
  }

  static Future<void> createOrUpdateUser(FirebaseUser user) async {
    DocumentReference ref = FirebaseFirestore.instance.collection('user').doc();
    return await ref.set(user.getDataMap());
  }

  static Future<List<Restoran>> getRestorans() async {
    List<Restoran> restorans = [];
    final querySnapshot =
        await FirebaseFirestore.instance.collection('restoran').get();
    for (var doc in querySnapshot.docs) {
      restorans.add(Restoran(
        name: doc.get('name'),
        city: doc.get('city'),
        district: doc.get('district'),
        imageUrl: doc.get('imageUrl'),
        geoPoint: doc.get('location'),
      ));
    }
    return restorans;
  }
}
