import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../generated/l10n.dart';
import 'custom_pin_form_field.dart';

class CustomPinSubmissionWidget extends StatefulWidget {
  final List<String?> verificationCode;
  final void Function(int, String?) onChanged;

  const CustomPinSubmissionWidget({
    super.key,
    required this.verificationCode,
    required this.onChanged,
  });

  @override
  _CustomPinSubmissionWidgetState createState() =>
      _CustomPinSubmissionWidgetState();
}

class _CustomPinSubmissionWidgetState extends State<CustomPinSubmissionWidget> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers; // List of controllers

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    _controllers = List.generate(
        6, (index) => TextEditingController()); // Initialize controllers
  }

  // @override
  // void dispose() {
  //   // Dispose focus nodes and controllers
  //   for (var node in _focusNodes) {
  //     node.dispose();
  //   }
  //   // for (var controller in _controllers) {
  //   //   controller.dispose();
  //   // }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return PinFormField(
            hintText: "*",
            width: 42.w,
            height: 42.w,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller:
                _controllers[index], // Use individual controller for each field
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: AppTextStyles.font24GreenW500
                .copyWith(fontWeight: FontWeight.w400),
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                _focusNodes[index + 1].requestFocus();
              } else if (value.isEmpty && index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
              widget.verificationCode[index] = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pinFieldError;
              }
              return null;
            },
            focusNode: _focusNodes[index],
          );
        }),
      ),
    );
  }
}
