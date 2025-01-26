import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity =
      Connectivity(); // Instance of the Connectivity plugin to check network status.
  late StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription; // Subscription to monitor connectivity changes.
  final RxList<ConnectivityResult> _connectionStatus = <ConnectivityResult>[]
      .obs; // Observable list to hold the connection status.

  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    // Subscribe to the connectivity changes and update the status when it changes.
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  /// This method is called whenever there is a change in network connectivity.
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value =
        result; // Update the status of connectivity based on the results.

    // Show a custom toast message if there is no internet connection.
    if (result.contains(ConnectivityResult.none)) {
      TLoaders.customToast(message: 'No Internet Connection');
    }
  }

  /// Check the internet connection status.
  /// Returns `true` if connected, `false` otherwise.
  Future<bool> isConnected() async {
    try {
      // Get the current connectivity status.
      final result = await _connectivity.checkConnectivity();

      // Return true if the connection is not 'none' (i.e., there is internet).
      if (result.any((element) => element != ConnectivityResult.none)) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (_) {
      // Return false if there is an exception (e.g., platform-specific issue).
      return false;
    }
  }

  /// Dispose or close the active connectivity stream when the controller is closed.
  @override
  void onClose() {
    super.onClose();
    // Cancel the subscription to prevent memory leaks.
    _connectivitySubscription.cancel();
  }
}
