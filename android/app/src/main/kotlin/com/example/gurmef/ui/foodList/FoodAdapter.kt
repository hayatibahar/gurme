package com.cloud.gurme.ui.foodList

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.AsyncListDiffer
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.cloud.gurme.databinding.FoodItemBinding
import com.cloud.gurme.models.Food

class FoodAdapter : RecyclerView.Adapter<FoodAdapter.FoodViewHolder>() {

    inner class FoodViewHolder(private val binding: FoodItemBinding) :
        RecyclerView.ViewHolder(binding.root) {
        fun bind(food: Food) {
            binding.tvFoodName.text = food.foodName

            itemView.setOnClickListener {
                onItemClickListener?.let { item ->
                    item(food.foodId)
                }
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): FoodViewHolder {
        val view = FoodItemBinding.inflate(
            LayoutInflater.from(parent.context),
            parent, false
        )
        return FoodViewHolder(view)
    }

    override fun onBindViewHolder(holder: FoodViewHolder, position: Int) {
        val food = differ.currentList[position]
        holder.bind(food)
    }

    override fun getItemCount(): Int = differ.currentList.size

    private var onItemClickListener: ((Int) -> Unit)? = null

    fun setOnItemClickListener(listener: (Int) -> Unit) {
        onItemClickListener = listener
    }


    private val diffUtil = object : DiffUtil.ItemCallback<Food>() {
        override fun areItemsTheSame(oldItem: Food, newItem: Food): Boolean {
            return oldItem.foodId == newItem.foodId //true
        }

        override fun areContentsTheSame(oldItem: Food, newItem: Food): Boolean {
            return oldItem == newItem //false
        }
    }

    val differ = AsyncListDiffer(this, diffUtil)
}