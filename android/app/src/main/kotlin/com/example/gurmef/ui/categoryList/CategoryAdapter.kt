package com.cloud.gurme.ui.categoryList

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.AsyncListDiffer
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.cloud.gurme.databinding.CategoryItemBinding
import com.cloud.gurme.models.Category


class CategoryAdapter : RecyclerView.Adapter<CategoryAdapter.CategoryViewHolder>() {

    inner class CategoryViewHolder(private val binding: CategoryItemBinding) :
        RecyclerView.ViewHolder(binding.root) {
        fun bind(category: Category) {
            binding.apply {
                tvCategoryName.text = category.categoryName
//
//                Glide.with(ivCategoryImage.context)
////                    .load("https://openai.com/content/images/2021/01/2x-no-mark-1.jpg")
//                    .centerCrop()
//                    .into(ivCategoryImage)

            }

            itemView.setOnClickListener {
                onItemClickListener?.let { item ->
                    item(category.categoryId)
                }
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryViewHolder {
        val view = CategoryItemBinding.inflate(
            LayoutInflater.from(parent.context),
            parent, false
        )
        return CategoryViewHolder(view)
    }

    override fun onBindViewHolder(holder: CategoryViewHolder, position: Int) {
        val category = differ.currentList[position]
        holder.bind(category)
    }

    override fun getItemCount(): Int = differ.currentList.size

    private var onItemClickListener: ((Int) -> Unit)? = null

    fun setOnItemClickListener(listener: (Int) -> Unit) {
        onItemClickListener = listener
    }


    private val diffUtil = object : DiffUtil.ItemCallback<Category>() {
        override fun areItemsTheSame(oldItem: Category, newItem: Category): Boolean {
            return oldItem.categoryId == newItem.categoryId //true
        }

        override fun areContentsTheSame(oldItem: Category, newItem: Category): Boolean {
            return oldItem == newItem //false
        }
    }

    val differ = AsyncListDiffer(this, diffUtil)
}