package com.cloud.gurme.ui.map

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.coroutineScope
import androidx.navigation.fragment.navArgs
import com.cloud.gurme.R
import com.cloud.gurme.databinding.FragmentMapBinding
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.google.maps.android.ktx.awaitAnimateCamera
import com.google.maps.android.ktx.awaitMapLoad
import com.google.maps.android.ktx.model.cameraPosition

class MapFragment : Fragment(), OnMapReadyCallback {

    private var _binding: FragmentMapBinding? = null
    private val binding get() = _binding!!

    private lateinit var mMap: GoogleMap

    private val args: MapFragmentArgs by navArgs()
    private var destinationLongitude = 0.0
    private var destinationLatitude = 0.0
    private lateinit var destination: LatLng


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentMapBinding.inflate(inflater, container, false)

        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        destinationLongitude = args.longitude.toDouble()
        destinationLatitude = args.latitude.toDouble()
        destination = LatLng(destinationLatitude, destinationLongitude)
        println("dest latitute ${destination.latitude} dest longitude ${destination.longitude}")
        val mapFragment = childFragmentManager.findFragmentById(R.id.map) as SupportMapFragment
        mapFragment.getMapAsync(this)
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    override fun onMapReady(p0: GoogleMap) {
        mMap = p0
        mMap.uiSettings.isZoomControlsEnabled = true
        setUpMap()
    }

    private fun setUpMap() {
        val markerOptions =
            MarkerOptions().position(destination)
        markerOptions.title("Bahçem Kafe")
        mMap.addMarker(markerOptions)
        lifecycle.coroutineScope.launchWhenStarted {
            mMap.run {
                awaitMapLoad()
                awaitAnimateCamera(CameraUpdateFactory.newCameraPosition(
                    cameraPosition {
                        target(destination)
                        zoom(18.0f)
                        bearing(90f)
                        tilt(45f)
                        build()
                    }
                ))
            }
        }
    }
}
