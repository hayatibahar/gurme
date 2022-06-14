package com.cloud.gurme.ui.categoryList

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.GridLayoutManager
import com.cloud.gurme.databinding.FragmentCategoryListBinding
import com.cloud.gurme.models.Category

class CategoryListFragment : Fragment() {
    private var _binding: FragmentCategoryListBinding? = null
    private val binding get() = _binding!!

    private var categoryAdatper = CategoryAdapter()

    private val viewModel: CategoryViewModel by viewModels()


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentCategoryListBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupRV()

        categoryAdatper.setOnItemClickListener {
            findNavController().navigate(
                CategoryListFragmentDirections
                    .actionCategoryListFragmentToMealListFragment(it))
        }

        viewModel.categoryList.observe(viewLifecycleOwner){
            categoryAdatper.differ.submitList(it)
        }
    }


    private fun setupRV() {
        binding.rvCategoryList.apply {
            adapter = categoryAdatper
            layoutManager = GridLayoutManager(requireContext(), 2)
            categoryAdatper.setOnItemClickListener {

            }
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

}