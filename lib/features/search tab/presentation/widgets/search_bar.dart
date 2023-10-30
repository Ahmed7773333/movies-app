// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onPreClicked;
  final VoidCallback func;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.onPreClicked,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.black)),
        fillColor: searchBarColor,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.black)),
        prefixIcon: InkWell(
            onTap: () {
              onPreClicked();
            },
            child: const Icon(Icons.search, color: Colors.white)),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall,
      ),
      onChanged: (value) {
        func();
      },
    );
  }
}
