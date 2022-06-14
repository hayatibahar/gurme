package com.cloud.gurme

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import com.cloud.gurme.databinding.FragmentAdminBinding
import com.cloud.gurme.models.Category
import com.cloud.gurme.models.Food
import com.cloud.gurme.models.Restaurant
import com.google.firebase.firestore.ktx.firestore
import com.google.firebase.ktx.Firebase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext

class AdminFragment : Fragment() {
//    private val categoryCollectionRef = Firebase.firestore.collection("category")
//    private val foodCollectionRef = Firebase.firestore.collection("food")
//    private val restaurantCollectionRef = Firebase.firestore.collection("restaurant")

    private var _binding: FragmentAdminBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentAdminBinding.inflate(inflater, container, false)
        return binding.root
    }

    fun categorySave(category: Category) : Boolean{
        if(category.categoryId == -1)
            return false
        if (category.categoryName.isEmpty())
            return false
        if (category.categoryImage.isEmpty())
            return false
        return true
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.apply {
            btnNext.setOnClickListener {
                findNavController().navigate(
                    AdminFragmentDirections
                        .actionAdminFragmentToCategoryListFragment()
                )
            }
           /* btnCategoryOkey.setOnClickListener {
                saveCategory(
                    Category(
                        etCategoryId.text.toString().toInt(),
                        etCategoryName.text.toString()
                    )
                )
            }
            btnFoodOkey.setOnClickListener {
                saveFood(
                    Food(
                        etFoodId.text.toString().toInt(),
                        etFoodCategoryId.text.toString().toInt(),
                        etFoodName.text.toString(),
                        etFoodImage.text.toString()
                    )
                )
            }
            btnRestaurantOkey.setOnClickListener {
                saveRestaurant(
                    Restaurant(
                        etRestaurantId.text.toString().toInt(),
                        etRestaurantAccount.text.toString(),
                        etRestaurantName.text.toString(),
                        etRestaurantLocation.text.toString(),
                        etRestaurantLatitude.text.toString().toDouble(),
                        etRestaurantLongitude.text.toString().toDouble(),
                        listOf(etRestaurantMealId.text.toString().toInt())
                    )
                )
            }*/
        }
    }
/*
    private fun saveCategory(category: Category) = CoroutineScope(Dispatchers.IO).launch {
        try {
            categoryCollectionRef
                .add(category)
                .await()
            withContext(Dispatchers.Main) {
                Toast.makeText(requireContext(), "Successfully saved data.", Toast.LENGTH_LONG)
                    .show()
            }
        } catch (e: Exception) {
            withContext(Dispatchers.Main) {
                Toast.makeText(requireContext(), e.message, Toast.LENGTH_LONG).show()
            }
        }
    }

    private fun saveFood(food: Food) = CoroutineScope(Dispatchers.IO).launch {
        try {
            foodCollectionRef
                .add(food)
                .await()
            withContext(Dispatchers.Main) {
                Toast.makeText(requireContext(), "Successfully saved data.", Toast.LENGTH_LONG)
                    .show()
            }
        } catch (e: Exception) {
            withContext(Dispatchers.Main) {
                Toast.makeText(requireContext(), e.message, Toast.LENGTH_LONG).show()
            }
        }
    }


    private fun saveRestaurant(restaurant: Restaurant) = CoroutineScope(Dispatchers.IO).launch {
        try {
            restaurantCollectionRef
                .add(restaurant)
                .await()
            withContext(Dispatchers.Main) {
                Toast.makeText(requireContext(), "Successfully saved data.", Toast.LENGTH_LONG)
                    .show()
            }
        } catch (e: Exception) {
            withContext(Dispatchers.Main) {
                Toast.makeText(requireContext(), e.message, Toast.LENGTH_LONG).show()
            }
        }
    }*/

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

}