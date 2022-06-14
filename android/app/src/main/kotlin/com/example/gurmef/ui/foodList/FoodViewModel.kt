package com.cloud.gurme.ui.foodList

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.cloud.gurme.models.Food
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.firestore.FirebaseFirestoreSettings
import com.google.firebase.firestore.ktx.toObject
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await

class FoodViewModel : ViewModel() {
    private var _foodList: MutableLiveData<MutableList<Food>> = MutableLiveData()
    val foodList: LiveData<MutableList<Food>> get() = _foodList
    private var firestore: FirebaseFirestore = FirebaseFirestore.getInstance()

    init {
        firestore.firestoreSettings = FirebaseFirestoreSettings.Builder().build()
    }

    fun getFoodWithId(categoryId: Int) {
        viewModelScope.launch {
            val querySnapshot = firestore.collection("food")
                .whereEqualTo("categoryId", categoryId)
                .get()
                .await()

            val list = mutableListOf<Food>()
            for (document in querySnapshot.documents) {
                val category = document.toObject<Food>()
                category?.let { list.add(it) }
                println(category?.foodName)
            }
            _foodList.postValue(list)
        }
    }
}