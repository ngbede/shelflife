import 'dart:developer';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String name;
  final bool validateField;
  final int? maxlen;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final int maxLine;
  const InputField({
    Key? key,
    required this.name,
    this.validateField = true,
    this.maxlen,
    this.leftPadding = 20.0,
    this.rightPadding = 20.0,
    this.bottomPadding = 20.0,
    this.topPadding = 5.0,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

bool _activateBorder = false;
const Color _activeColor = Color(0XFF27303D); // #2C303D
const Color _inactiveColor = Color(0XFFE1E1E1);

class _InputFieldState extends State<InputField> {
  TextEditingController? _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _activateBorder = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: _activateBorder ? _activeColor : _inactiveColor,
              width: 1,
            ),
            right: BorderSide(
              color: _activateBorder ? _activeColor : _inactiveColor,
              width: 1,
            ),
            top: BorderSide(
              color: _activateBorder ? _activeColor : _inactiveColor,
              width: 1,
            ),
            bottom: const BorderSide(color: _activeColor, width: 2.2),
          ),
        ),
        child: TextField(
          controller: _controller,
          onTap: () {
            setState(() {
              _activateBorder = true;
            });
          },
          onChanged: (value) {
            log(value);
          },
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: _activeColor,
          ),
          maxLength: widget.maxlen,
          maxLines: widget.maxLine,
          cursorColor: const Color(0XFF27303D),
          cursorHeight: 30,
          decoration: const InputDecoration(
              hintText: "Filter subscribed items...",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0XFFEFEFEF),
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
