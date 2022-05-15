import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? textController;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String label;
  final bool readOnly;
  final bool autofocus;
  final VoidCallback? onTap;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.textController,
    this.initialValue,
    this.textInputType,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.validator,
    required this.label,
    this.readOnly = false,
    this.onTap,
    this.suffix,
    this.inputFormatters,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        readOnly: widget.readOnly,
        controller: widget.textController,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        textCapitalization: widget.textCapitalization,
        textAlign: widget.textAlign,
        onTap: widget.onTap,
        inputFormatters: widget.inputFormatters,
        autofocus: widget.autofocus,
        decoration: InputDecoration(
          hintText: widget.label,
          border: InputBorder.none,
          errorStyle: const TextStyle(color: Colors.red),
          suffix: widget.suffix,
        ),
      ),
    );
  }
}
