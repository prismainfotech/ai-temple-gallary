/// Storage keys constants for GetStorage
class StorageKeys {
  // Private constructor to prevent instantiation
  StorageKeys._();
  
  // Chat related keys
  static const String harrisonsChatHistory = 'harrison_chat_history';
  static const String chatLastUpdated = 'chat_last_updated';
  
  // User preferences
  static const String userPreferences = 'user_preferences';
  static const String themeMode = 'themeMode'; // Updated key to match usage
  static const String hasCompletedOnboarding = 'hasCompletedOnboarding';
  static const String isPinEnabled = 'isPinEnabled';
  static const String isReminderEnabled = 'isReminderEnabled';
  static const String savedPin = 'savedPin';
  static const String reminderHour = 'reminderHour';
  static const String reminderMinute = 'reminderMinute';
  static const String primaryColor = 'primaryColor';
  static const String appConfig = 'appConfig';
  
  // Auth related
  static const String isLoggedIn = 'is_logged_in';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  static const String userPhotoUrl = 'user_photo_url';
  static const String userId = 'user_id';
  static const String lastLoginTime = 'last_login_time';
  
  // Question bank filters
  static const String lastSelectedYear = 'last_selected_year';
  static const String lastSelectedMonth = 'last_selected_month';
  static const String lastSelectedSection = 'last_selected_section';
  static const String lastSelectedChapter = 'last_selected_chapter';

  // Goals
  static const String goals = 'goals';

  // Reflections
  static const String reflections = 'reflections';

  // Diary
  static const String moods = 'moods';
  static const String activities = 'activities';
  static const String diaryEntries = 'diary_entries';
}
