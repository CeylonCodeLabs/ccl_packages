part of '../widgets.dart';

/// A view model for the `CCLLocalization` widget.
///
/// This view model provides access to the `localeController` stream and the current `locale`
/// from the `LocalizationService`.
class CCLLocalizationModel extends BaseViewModel {
  /// The localization service used to access locale information.
  final LocalizationService _localizationService = StackedLocator.instance.get();

  /// A stream of the current locale.
  Stream<Locale> get localeController => _localizationService.localeController;

  /// The current locale.
  Locale get locale => _localizationService.getLocale();
}