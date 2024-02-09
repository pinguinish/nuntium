import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uikit/const/nuntium_palette.dart';

typedef PincodeValueChanged<T> = void Function(List<T>);

class PincodeInput extends StatefulWidget {
  const PincodeInput({
    super.key,
    this.onChanged,
    this.onComplete,
    this.digitsOnly = true,
    this.countSymbols = 4,
  });

  final int countSymbols;
  final bool digitsOnly;
  final PincodeValueChanged<String?>? onChanged;
  final PincodeValueChanged<String>? onComplete;

  @override
  State<PincodeInput> createState() => _PincodeInputState();
}

class _PincodeInputState extends State<PincodeInput> {
  late final List<TextEditingController> controllers =
      List.generate(widget.countSymbols, (_) => TextEditingController());

  late final List<FocusNode> focuses =
      List.generate(widget.countSymbols, (_) => FocusNode());

  late final List<String?> _value = List.filled(widget.countSymbols, null);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: 10,
        children: List.generate(widget.countSymbols, (index) {
          return _PincodeInputElement(
            focus: focuses[index],
            controller: controllers[index],
            onChanged: (value) => _onChanged(value, index),
            digitsOnly: widget.digitsOnly,
          );
        }),
      ),
    );
  }

  void _onChanged(String value, int index) {
    if (value.isEmpty) return;
    _handleBackspace(index);
    _handleRemovingSymbol(index);
    _value[index] = value;
    widget.onChanged?.call(_value);
    if (!_value.contains(null)) widget.onComplete?.call(_value.cast<String>());
    focuses[index].nextFocus();
  }

  void _handleBackspace(int index) {
    focuses[index].onKeyEvent = (node, event) {
      if (event.physicalKey == PhysicalKeyboardKey.backspace) {
        controllers[index].clear();
        _value[index] = null;
        widget.onChanged?.call(_value);
      }
      return KeyEventResult.ignored;
    };
  }

  void _handleRemovingSymbol(int index) {
    if (index + 1 < controllers.length &&
        controllers[index + 1].text.isNotEmpty) {
      focuses[index].unfocus();
      return;
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class _PincodeInputElement extends StatelessWidget {
  const _PincodeInputElement({
    required this.onChanged,
    required this.controller,
    required this.focus,
    this.digitsOnly = false,
  });

  final FocusNode focus;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool digitsOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 70,
      child: TextFormField(
        focusNode: focus,
        enableInteractiveSelection: false,
        controller: controller,
        showCursor: false,
        onChanged: onChanged,
        autofocus: true,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: NuntiumPalette.blackPrimary,
          fontSize: 16,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w600,
        ),
        expands: true,
        maxLines: null,
        minLines: null,
        inputFormatters: [
          // [TODO]: add custom filtration
          if (digitsOnly) FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
          isDense: true,
          constraints: BoxConstraints(minHeight: 72, minWidth: 72),
          hoverColor: Colors.transparent,
          hintText: "-",
          hintStyle: TextStyle(
            color: NuntiumPalette.greyPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          counterText: "",
          fillColor: NuntiumPalette.greyLighter,
          focusColor: Colors.red,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: NuntiumPalette.purplePrimary),
          ),
        ),
      ),
    );
  }
}
