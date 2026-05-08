abstract class AuthRepository {
  /// Sign up as owner with email and password
  Future<String> signupOwner({
    required String email,
    required String password,
    required String displayName,
  });

  /// Login as owner
  Future<String> loginOwner({
    required String email,
    required String password,
  });

  /// Get writer identity (can be anonymous)
  Future<String> getOrCreateWriterIdentity({
    required String ownerPageId,
    String? email,
    String? displayName,
    required bool isAnonymous,
  });

  /// Logout
  Future<void> logout();

  /// Get current user ID
  String? getCurrentUserId();

  /// Check if user is authenticated
  bool isAuthenticated();

  /// Reset password
  Future<void> resetPassword(String email);
}
