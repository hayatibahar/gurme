package com.cloud.gurme.models

data class Restaurant(
    val restaurantId : Int = -1,
    val restaurantAccount : String = "",
    val restaurantName : String = "",
    val restaurantLocation : String = "",
    val restaurantLatitude : Double = 0.0,
    val restaurantLongitude : Double = 0.0,
    val foodIds : List<Int> = listOf()
)