part of '../ccl_services.dart';

/// A service that manages the application's locale.
class LocalizationService implements InitializableDependency {
  /// Logging tag for this service.
  // ignore: constant_identifier_names
  static const String TAG = 'LocalizationService';

  /// The secure storage service used to persist the locale.
  final SecureStorageService _secureStorageService =
  StackedLocator.instance.get();

  /// The controller for the current locale.
  late final BehaviorSubject<Locale> _localeController;

  /// A stream of the current locale.
  BehaviorSubject<Locale> get localeController => BehaviorSubject();

  /// Initializes the service by loading the locale from secure storage.
  @override
  Future<void> init() async {
    final val = await _secureStorageService.locale.read();
    final locale = val.isNotNullOrEmpty ? Locale(val!) : const Locale('en');
    _localeController = BehaviorSubject.seeded(locale);
  }

  /// Updates the current locale and persists it to secure storage.
  void onLocaleChanged(Locale locale) => _localeController.add(locale);
}