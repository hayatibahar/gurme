package com.cloud.gurme.ui.foodList

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.navigation.fragment.findNavController
import androidx.navigation.fragment.navArgs
import androidx.recyclerview.widget.LinearLayoutManager
import com.cloud.gurme.databinding.FragmentFoodListBinding

class FoodListFragment : Fragment() {

    private var _binding: FragmentFoodListBinding? = null
    private val binding get() = _binding!!

    private val args: FoodListFragmentArgs by navArgs()

    private var foodAdapter = FoodAdapter()

    private val viewModel: FoodViewModel by viewModels()


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentFoodListBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupRV()
        binding.apply {
            btnNext.setOnClickListener {
                findNavController().navigate(
                    FoodListFragmentDirections
                        .actionMealListFragmentToRestaurantListFragment()
                )
            }

        }
        foodAdapter.setOnItemClickListener {
            findNavController().navigate(
                FoodListFragmentDirections
                    .actionMealListFragmentToRestaurantListFragment(it)
            )
        }

        val categoryId = args.categoryId

        viewModel.getFoodWithId(categoryId)
        viewModel.foodList.observe(viewLifecycleOwner) {
            foodAdapter.differ.submitList(it)

        }
    }

    private fun setupRV() {
        binding.rvFood.apply {
            adapter = foodAdapter
            layoutManager = LinearLayoutManager(requireContext())
            foodAdapter.setOnItemClickListener {

            }
        }
    }


    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

}