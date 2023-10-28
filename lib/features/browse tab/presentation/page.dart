import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/features/browse%20tab/widgets/CategoryModel.dart';
import 'package:movies_app/features/browse%20tab/widgets/GridView.dart';

import '../../../core/utils/styles.dart';
import '../../movie detail screen/presentation/widgets/category_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.getCategories();
    return Scaffold(body: Center(
        child: GridViewCatItem(categories)));
  }
}

//GridView(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         children: [
//           Stack(
//             children: [
//               Image.asset(
//                 bigTemp,
//                 fit: BoxFit.fill,
//               ),
//               Text("action",
//                   style: GoogleFonts.exo(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18.sp,
//                   )),
//             ],
//           ),
//           Stack(
//             children: [
//               Image.asset(
//                 bigTemp,
//                 fit: BoxFit.fill,
//               ),
//               Text("action",
//                   style: GoogleFonts.exo(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18.sp,
//                   )),
//             ],
//           ),
//           Stack(
//             children: [
//               Image.asset(
//                 bigTemp,
//                 fit: BoxFit.fill,
//               ),
//               Text("action",
//                   style: GoogleFonts.exo(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18.sp,
//                   )),
//             ],
//           ),
//           Stack(
//             children: [
//               Image.asset(
//                 bigTemp,
//                 fit: BoxFit.fill,
//               ),
//               Text("action",
//                   style: GoogleFonts.exo(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18.sp,
//                   )),
//             ],
//           ),
//           Stack(
//             children: [
//               Image.asset(
//                 bigTemp,
//                 fit: BoxFit.fill,
//               ),
//               Text("action",
//                   style: GoogleFonts.exo(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18.sp,
//                   )),
//             ],
//           ),
//           Stack(
//             children: [
//               Image.asset(
//                 bigTemp,
//                 fit: BoxFit.fill,
//               ),
//               Text("action",
//                   style: GoogleFonts.exo(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18.sp,
//                   )),
//             ],
//           ),
//         ],
//       ),
