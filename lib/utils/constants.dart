import 'package:flutter/material.dart';

InputDecoration kTextFieldInputDecoration(
        {String? hintText, String? errorText, IconData? suffixIcon}) =>
    InputDecoration(
      errorText: errorText,
      filled: true,

      focusColor: Colors.blue.shade400,
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: const BorderSide(
            color: Color(0xFFFFc529),
          )),
      isDense: true,
      prefixIcon: Icon(
        suffixIcon,
        size: 30,
        color: Colors.blue.shade400,
      ),
      // contentPadding: EdgeInsets.all(12),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFFFc529)),
        borderRadius: BorderRadius.circular(15),
      ),
      hintStyle:
          TextStyle(color: Colors.grey, fontSize: 16, letterSpacing: 1.2),
      hintText: hintText,
    );
