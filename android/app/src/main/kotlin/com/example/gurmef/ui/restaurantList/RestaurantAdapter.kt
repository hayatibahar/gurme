package com.cloud.gurme.ui.restaurantList

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.AsyncListDiffer
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.cloud.gurme.databinding.RestaurantItemBinding
import com.cloud.gurme.models.Restaurant
import com.google.android.gms.maps.model.LatLng

class RestaurantAdapter : RecyclerView.Adapter<RestaurantAdapter.RestaurantViewHolder>() {

    inner class RestaurantViewHolder(private val binding: RestaurantItemBinding) :
        RecyclerView.ViewHolder(binding.root) {
        fun bind(restaurant: Restaurant) {
            binding.tvRestaurantName.text = restaurant.restaurantName


            itemView.setOnClickListener {
                onItemClickListener?.let { item ->
                    item(restaurant)
                }
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RestaurantViewHolder {
        val view = RestaurantItemBinding.inflate(
            LayoutInflater.from(parent.context),
            parent, false
        )
        return RestaurantViewHolder(view)
    }

    override fun onBindViewHolder(holder: RestaurantViewHolder, position: Int) {
        val restaurant = differ.currentList[position]
        holder.bind(restaurant)
    }

    override fun getItemCount(): Int = differ.currentList.size

    private var onItemClickListener: ((Restaurant) -> Unit)? = null

    fun setOnItemClickListener(listener: (Restaurant) -> Unit) {
        onItemClickListener = listener
    }


    private val diffUtil = object : DiffUtil.ItemCallback<Restaurant>() {
        override fun areItemsTheSame(oldItem: Restaurant, newItem: Restaurant): Boolean {
            return oldItem.restaurantId == newItem.restaurantId //true
        }

        override fun areContentsTheSame(oldItem: Restaurant, newItem: Restaurant): Boolean {
            return oldItem == newItem //false
        }
    }

    val differ = AsyncListDiffer(this, diffUtil)

/*
    fun calculateDistance(
        lat1: Double,
        lat2: Double, lon1: Double,
        lon2: Double
    ) : Double{
        val lon1Radians = Math.toRadians(lon1)
        val lon2Radians = Math.toRadians(lon2)
        val lat1Radians = Math.toRadians(lat1)
        val lat2Radians = Math.toRadians(lat2)

        // Haversine formula
        val dlon = lon2Radians - lon1Radians
        val dlat = lat2Radians - lat1Radians
        val a = (Math.pow(Math.sin(dlat / 2), 2.0)
                + (Math.cos(lat1Radians) * Math.cos(lat2Radians)
                * Math.pow(Math.sin(dlon / 2), 2.0)))
        val c = 2 * Math.asin(Math.sqrt(a))

        // Radius of earth in kilometers. Use 3956
        // for miles
        val r = 6371.0

        // calculate the result
        return c * r
    }*/
}