import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/features/browse%20tab/widgets/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryItem(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(categoryModel.categoryImage,fit: BoxFit.fill,),
        Text(categoryModel.categoryName,style: GoogleFonts.exo(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18.sp,)),
      ],
    );
  }
}