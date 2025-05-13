import 'dart:async';

class BadgeService {
  // Private constructor to prevent external instantiation
  BadgeService._privateConstructor();

  // Static instance of BadgeService
  static final BadgeService _instance = BadgeService._privateConstructor();

  // Getter for the instance
  static BadgeService get instance => _instance;

  // StreamController to manage the badge state
  final StreamController<bool> _badgeStreamController = StreamController<bool>.broadcast();

  // Stream to listen to the badge state
  Stream<bool> get badgeStream => _badgeStreamController.stream;

  // Method to update badge visibility
  void updateBadgeVisibility(bool isVisible) {
    _badgeStreamController.add(isVisible);
  }

  // Don't forget to close the StreamController when done
  void dispose() {
    _badgeStreamController.close();
  }
}
