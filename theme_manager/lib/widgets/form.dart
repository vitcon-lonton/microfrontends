part of 'widgets.dart';

const kIconError = Icon(Icons.error_outline);
final kInputBorderRadius = BorderRadius.circular(0);
// final kBorderSide = BorderSide(width: 0.2, color: kColorGrey2);
const kIconTheme = IconThemeData(size: 18);
final kIconErrorTheme = kIconTheme.copyWith(color: kColorError);

// final kInputBorder = OutlineInputBorder(
//     borderRadius: kInputBorderRadius,
//     borderSide: const BorderSide(width: 2, color: kColorPrimary));
final kInputBorder = OutlineInputBorder(
    borderRadius: kInputBorderRadius, borderSide: const BorderSide(width: 2));
final kFocusedBorder = kInputBorder.copyWith();
final kEnabledBorder = kInputBorder.copyWith();
final kDisabledBorder = kInputBorder.copyWith();
final kFocusedErrorBorder = kInputBorder.copyWith();
final kErrorBorder =
    kInputBorder.copyWith(borderSide: const BorderSide(color: kColorError));

//
// Update contentPadding
// EdgeInsets.fromLTRB(8, 0, 8, 0) to EdgeInsets.fromLTRB(12, 8, 12, 0)
final kInputTheme = InputDecorationTheme(
  // filled: true,
  border: kInputBorder,
  hintStyle: kTextInputHint,
  alignLabelWithHint: false,
  labelStyle: kTextInputLabel,
  errorStyle: kTextInputError,
  // errorBorder: kErrorBorder,
  enabledBorder: kEnabledBorder,
  // focusedBorder: kFocusedBorder,
  // disabledBorder: kDisabledBorder,
  // focusedErrorBorder: kFocusedErrorBorder,
  contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
);

final kInputDecoration = const InputDecoration().applyDefaults(kInputTheme);

class WTextInput extends StatelessWidget {
  const WTextInput({
    Key? key,
    this.label,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.height = 40.0,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.autofocus = false,
    this.require = false,
    this.requireColor,
    this.fillColor,
    this.borderColor,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.border,
    this.inputDecoration,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.validator,
    this.contentPadding,
    this.errorPadding,
    this.textCapitalization,
  }) : super(key: key);

  // Props
  final String? label;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final double? height;
  final int? maxLines;
  final bool? enabled;
  final bool readOnly;
  final bool obscureText;
  final bool autofocus;
  final bool require;
  final Color? requireColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final InputBorder? border;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final String? Function(String?)? validator;
  final EdgeInsets? contentPadding;
  final EdgeInsets? errorPadding;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    // Get theme from context
    final themeData = Theme.of(context);

    // Setup effective props
    final isError = errorText != null;
    Widget effectiveErrorText = kSpaceZero;
    Widget effectiveLabelText = kSpaceZero;
    InputBorder inputBorder =
        border ?? kInputBorder.copyWith(borderRadius: borderRadius);
    Widget? effectiveSuffixIcon = suffixIcon;

    if (label != null) {
      effectiveLabelText = DefaultTextStyle(
        style: kTextInputLabel.merge(labelStyle),
        child: Row(
          children: [
            if (label != null) Text(label!),
            if (require) const Text(' *')
          ],
        ),
      );
    }

    // Error status, error icon, error text
    if (isError) {
      inputBorder = kInputTheme.errorBorder ?? kErrorBorder;
      effectiveSuffixIcon =
          IconTheme(data: kIconErrorTheme, child: suffixIcon ?? kIconError);
      effectiveErrorText =
          Text(errorText!, style: kTextInputError.merge(errorStyle));
    }

    final effectiveDecoration = inputDecoration ??
        kInputDecoration
            .applyDefaults(kInputTheme)
            .copyWith(errorStyle: const TextStyle(height: 0, fontSize: 0.1))
            .copyWith(
              hintText: hintText,
              border: inputBorder,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              errorText: isError ? '' : null,
              contentPadding: contentPadding,
              suffixIcon: effectiveSuffixIcon,
              hintStyle: kTextInputHint.merge(hintStyle),
              filled: fillColor == null ? false : true,
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        effectiveLabelText,
        SizedBox(
          // height: height,
          child: TextFormField(
            onTap: onTap,
            enabled: enabled,
            readOnly: readOnly,
            maxLines: maxLines,
            validator: validator,
            autofocus: autofocus,
            onChanged: onChanged,
            style: kTextInput.merge(style),
            controller: controller,
            obscureText: obscureText,
            initialValue: initialValue,
            keyboardType: keyboardType,
            decoration: effectiveDecoration,
            textInputAction: textInputAction,
            cursorColor: themeData.primaryColor,
            onEditingComplete: onEditingComplete,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
          ),
        ),
        if (isError) ...[kVSpaceXXS, effectiveErrorText]
      ],
    );
  }
}
