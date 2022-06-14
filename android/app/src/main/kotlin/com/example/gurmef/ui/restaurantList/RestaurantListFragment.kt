package com.cloud.gurme.ui.restaurantList

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.navigation.fragment.findNavController
import androidx.navigation.fragment.navArgs
import androidx.recyclerview.widget.LinearLayoutManager
import com.cloud.gurme.databinding.FragmentRestaurantListBinding
import timber.log.Timber

class RestaurantListFragment : Fragment() {

    private var _binding: FragmentRestaurantListBinding? = null
    private val binding get() = _binding!!

    private val args: RestaurantListFragmentArgs by navArgs()

    private var restaurantAdapter = RestaurantAdapter()

    private val viewModel: RestaurantViewModel by viewModels()

//    private lateinit var fusedLocationClient: FusedLocationProviderClient

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentRestaurantListBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        Timber.d("restaurant list created")
        setupRV()

        restaurantAdapter.setOnItemClickListener {
            findNavController().navigate(
                RestaurantListFragmentDirections
                    .actionRestaurantListFragmentToMapFragment
                        (it.restaurantLatitude.toFloat(), it.restaurantLongitude.toFloat())
            )
        }

        val foodId = args.foodId
        viewModel.getRestaurantsWithId(foodId)
        viewModel.restaurantList.observe(viewLifecycleOwner) {
            restaurantAdapter.differ.submitList(it)
        }
    }

    private fun setupRV() {
        binding.rvRestaurant.apply {
            adapter = restaurantAdapter
            layoutManager = LinearLayoutManager(requireContext())
            restaurantAdapter.setOnItemClickListener {

            }
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

}