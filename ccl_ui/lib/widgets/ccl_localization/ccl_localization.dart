part of '../widgets.dart';

/// A widget that provides localization for its child widget.
///
/// This widget listens to the `localeController` stream in the `CCLLocalizationModel`
/// and rebuilds its child widget with the updated locale using `CCLLocalizationProvider`.
class CCLLocalization extends StackedView<CCLLocalizationModel> {
  /// The child widget to localize.
  final Widget child;

  /// Creates a new `CCLLocalization` widget.
  const CCLLocalization({super.key, required this.child});

  @override
  Widget builder(
      BuildContext context,
      CCLLocalizationModel viewModel,
      Widget? child,
      ) {
    /// Listens to the `localeController` stream and rebuilds the child widget
    /// with the updated locale.
    return StreamWidget(
      stream: viewModel.localeController,
      done: (Locale? data) {
        /// Provides the updated locale to the child widget.
        return CCLLocalizationProvider(
          locale: viewModel.locale,
          child: this.child,
        );
      },
    );
  }

  @override
  CCLLocalizationModel viewModelBuilder(BuildContext context) =>
      CCLLocalizationModel();
}