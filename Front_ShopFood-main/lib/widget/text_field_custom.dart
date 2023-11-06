import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/widget/text_custom.dart';

// ignore: must_be_immutable
class TextFieldCustom extends StatefulWidget {
  TextFieldCustom(
      {key,
      this.label,
      required this.hint,
      required this.controller,
      this.textAlign,
      this.circular,
      this.widthSizedBox,
      this.mainAxisAlignment,
      this.widthText,
      this.edgeInsets,
      this.ob});

  String? label;
  String hint;
  TextEditingController controller;
  TextAlign? textAlign;
  double? circular;
  double? widthSizedBox;
  MainAxisAlignment? mainAxisAlignment;
  double? widthText;
  EdgeInsets? edgeInsets;
  String? ob;
  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.circular ?? 10),
                ),
              ),
              hintText: widget.hint,
              hintStyle: GoogleFonts.kanit(
                fontSize: 18,
              ),
              contentPadding: widget.edgeInsets),
          textAlign: widget.textAlign ?? TextAlign.start,
          style: GoogleFonts.kanit(
            fontSize: 18,
            color: Colors.black,
          ),
          onChanged: (String value) {},
        )),
      ],
    );
  }
}
