part of '../ccl_services.dart';

/// A service that manages the application's locale.
class LocalizationService with ListenableServiceMixin implements InitializableDependency {
  /// Logging tag for this service.
  // ignore: constant_identifier_names
  static const String TAG = 'LocalizationService';

  /// The secure storage service used to persist the locale.
  final SecureStorageService _secureStorageService =
  StackedLocator.instance.get();

  late final ReactiveValue<Locale> _locale;

  /// Initializes the service by loading the locale from secure storage.
  @override
  Future<void> init() async {
    final val = await _secureStorageService.locale.read();
    final languageCode = val ?? Intl.getCurrentLocale();
    final locale = Locale(languageCode);
    _locale = ReactiveValue(locale);
  }

  Locale getLocale() => _locale.value;

  /// Updates the current locale and persists it to secure storage.
  Future<void> setLocale(Locale locale) async {
    await _secureStorageService.locale.set(locale.languageCode);
    _locale.value = locale;
    notifyListeners();
  }
}
