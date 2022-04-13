import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomFormTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle,
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            cursorColor: kBlackColor,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: blackTextStyle.copyWith(
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
