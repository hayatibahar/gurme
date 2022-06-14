package com.cloud.gurme.ui.restaurantList

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.cloud.gurme.models.Restaurant
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.firestore.FirebaseFirestoreSettings
import com.google.firebase.firestore.ktx.toObject
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await

class RestaurantViewModel : ViewModel() {
    private var _restaurantList: MutableLiveData<MutableList<Restaurant>> = MutableLiveData()
    val restaurantList: LiveData<MutableList<Restaurant>> get() = _restaurantList
    private var firestore: FirebaseFirestore = FirebaseFirestore.getInstance()

    init {
        firestore.firestoreSettings = FirebaseFirestoreSettings.Builder().build()
    }

    fun getRestaurantsWithId(foodId: Int) {
        viewModelScope.launch {
            val querySnapshot = firestore.collection("restaurant")
                .whereArrayContains("foodIds", foodId)
                .get()
                .await()

            val list = mutableListOf<Restaurant>()
            for (document in querySnapshot.documents) {
                val restaurant = document.toObject<Restaurant>()
                restaurant?.let { list.add(it) }
                println(restaurant?.restaurantName)
            }
            _restaurantList.postValue(list)
        }
    }

}