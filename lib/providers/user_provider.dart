// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../helpers/api_service.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService(); // Instance of API service
  AppUser? _user; // Holds the current user
  bool _isLoading = false; // Loading state for API calls
  String? _errorMessage; // Error message if login fails

  AppUser? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Login method to authenticate user
  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await _apiService.login(email, password); // Call login API
      _user = AppUser.fromJson(response); // Create user from JSON response
      _errorMessage = null; // Clear any previous error messages
    } catch (error) {
      _errorMessage = 'Login failed'; // Set error message on failure
    } finally {
      _isLoading = false; // Set loading state to false
      notifyListeners(); // Notify listeners to rebuild UI
    }
  }

  // Logout method to clear user data
  void logout() {
    _user = null; // Clear user data
    notifyListeners(); // Notify listeners
  }
}
