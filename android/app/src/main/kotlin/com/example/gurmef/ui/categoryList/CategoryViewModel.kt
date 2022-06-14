package com.cloud.gurme.ui.categoryList

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.cloud.gurme.models.Category
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.firestore.FirebaseFirestoreSettings
import com.google.firebase.firestore.ktx.toObject
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await

class CategoryViewModel : ViewModel(){
    private var _categoryList : MutableLiveData<MutableList<Category>> = MutableLiveData()
    val categoryList : LiveData<MutableList<Category>> get() = _categoryList
    private var firestore: FirebaseFirestore = FirebaseFirestore.getInstance()

    init {
        firestore.firestoreSettings = FirebaseFirestoreSettings.Builder().build()
        getCategory()
    }

    private fun getCategory(){
        viewModelScope.launch {
            val querySnapshot = firestore.collection("category")
                .get()
                .await()

            val list = mutableListOf<Category>()
            for (document in querySnapshot.documents){
                val category = document.toObject<Category>()
                category?.let { list.add(it) }
                println(category?.categoryName)
            }
            _categoryList.value = list
        }
    }
}