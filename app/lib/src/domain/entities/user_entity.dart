/// Domain entity representing a user (Owner or Writer)
class UserEntity {
  final String userId;
  final String email;
  final String displayName;
  final String? profilePictureUrl;
  final String? bio;
  final String userType; // 'owner' or 'writer'
  final bool isAnonymous;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.userId,
    required this.email,
    required this.displayName,
    this.profilePictureUrl,
    this.bio,
    required this.userType,
    required this.isAnonymous,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create copy with modifications
  UserEntity copyWith({
    String? userId,
    String? email,
    String? displayName,
    String? profilePictureUrl,
    String? bio,
    String? userType,
    bool? isAnonymous,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      bio: bio ?? this.bio,
      userType: userType ?? this.userType,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;
}

/// Owner-specific entity
class OwnerEntity extends UserEntity {
  final bool isPrivateProfile;
  final bool isAnonymousMessagesAllowed;

  const OwnerEntity({
    required String userId,
    required String email,
    required String displayName,
    String? profilePictureUrl,
    String? bio,
    required this.isPrivateProfile,
    required this.isAnonymousMessagesAllowed,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
    userId: userId,
    email: email,
    displayName: displayName,
    profilePictureUrl: profilePictureUrl,
    bio: bio,
    userType: 'owner',
    isAnonymous: false,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  OwnerEntity copyWith({
    String? userId,
    String? email,
    String? displayName,
    String? profilePictureUrl,
    String? bio,
    bool? isPrivateProfile,
    bool? isAnonymousMessagesAllowed,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OwnerEntity(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      bio: bio ?? this.bio,
      isPrivateProfile: isPrivateProfile ?? this.isPrivateProfile,
      isAnonymousMessagesAllowed: isAnonymousMessagesAllowed ?? this.isAnonymousMessagesAllowed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Writer identity (can be anonymous)
class WriterIdentity extends UserEntity {
  const WriterIdentity({
    required String userId,
    required String email,
    required String displayName,
    String? profilePictureUrl,
    String? bio,
    required bool isAnonymous,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
    userId: userId,
    email: email,
    displayName: displayName,
    profilePictureUrl: profilePictureUrl,
    bio: bio,
    userType: 'writer',
    isAnonymous: isAnonymous,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  WriterIdentity copyWith({
    String? userId,
    String? email,
    String? displayName,
    String? profilePictureUrl,
    String? bio,
    bool? isAnonymous,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WriterIdentity(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      bio: bio ?? this.bio,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
