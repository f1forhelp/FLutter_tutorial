//Single responsibility states that a class , module or function should have only one reason to change.
//Meaning it should focus on a single responsibility or concern. This improves maintainability , readability and testabilty.

//So instead of this we can split UserManager in AuthManager and ProfileManager
class UserManager {
  bool authenticateUser(String username, String password) {
    return true;
  }

  void updateUserProfile(String username, Map<String, dynamic> data) {
    print("Updated user profile");
  }
}

class AuthManager {
  bool authenticateUser(String username, String password) {
    return true;
  }
}

class ProfileManager {
  void updatePriofile(String username, Map<String, dynamic> profileData) {
    print("Profile data updated $profileData");
  }
}
