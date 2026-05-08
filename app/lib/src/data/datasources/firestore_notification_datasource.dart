class FirestoreNotificationDataSource {
  final FirebaseFirestore _firestore;

  FirestoreNotificationDataSource(this._firestore);

  /// Create notification
  Future<void> createNotification({
    required String userId,
    required String title,
    required String message,
    required String type, // 'new_memory', 'anniversary', 'mention', etc.
    String? relatedMemoryId,
    String? actionUrl,
  }) async {
    try {
      await _firestore.collection('notifications').add({
        'userId': userId,
        'title': title,
        'message': message,
        'type': type,
        'relatedMemoryId': relatedMemoryId,
        'actionUrl': actionUrl,
        'isRead': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to create notification: $e');
    }
  }

  /// Get notifications for user
  Future<List<DocumentSnapshot>> getNotifications({
    required String userId,
    int limit = 20,
  }) async {
    try {
      final snapshot = await _firestore
          .collection('notifications')
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(limit)
          .get();

      return snapshot.docs;
    } catch (e) {
      throw Exception('Failed to fetch notifications: $e');
    }
  }

  /// Mark notification as read
  Future<void> markAsRead(String notificationId) async {
    try {
      await _firestore
          .collection('notifications')
          .doc(notificationId)
          .update({'isRead': true});
    } catch (e) {
      throw Exception('Failed to mark notification as read: $e');
    }
  }

  /// Delete notification
  Future<void> deleteNotification(String notificationId) async {
    try {
      await _firestore.collection('notifications').doc(notificationId).delete();
    } catch (e) {
      throw Exception('Failed to delete notification: $e');
    }
  }

  /// Set up FCM token for user
  Future<void> saveFCMToken({
    required String userId,
    required String fcmToken,
  }) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .update({'fcmToken': fcmToken});
    } catch (e) {
      throw Exception('Failed to save FCM token: $e');
    }
  }
}
