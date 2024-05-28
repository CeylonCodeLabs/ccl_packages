part of '../ccl_services.dart';

class LocalizationService implements InitializableDependency {
  // ignore: constant_identifier_names
  static const String TAG = 'LocalizationService';

  final SecureStorageService _secureStorageService =
      StackedLocator.instance.get();

  late final BehaviorSubject<Locale> _localeController;

  BehaviorSubject<Locale> get localeController => BehaviorSubject();

  @override
  Future<void> init() async {
    final val = await _secureStorageService.locale.read();
    final locale = val.isNotNullOrEmpty ? Locale(val!) : const Locale('en');
    _localeController = BehaviorSubject.seeded(locale);
  }

  void onLocaleChanged(Locale locale) => _localeController.add(locale);
}
