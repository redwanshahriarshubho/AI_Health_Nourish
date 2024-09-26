// import 'package:flutter/material.dart';
// import '../../core/app_export.dart';
// import '../../widgets/custom_icon_button.dart';
// import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable
// import '../four_screen/four_screen.dart';
// import '../five_screen/five_screen.dart';
// // ignore_for_file: must_be_immutable
// class SevenScreen extends StatelessWidget {
//   SevenScreen({Key? key})
//       : super(
//     key: key,
//   );
//
//   TextEditingController messageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SizedBox(
//           width: double.maxFinite,
//
//           child: Container(
//             child: SizedBox(
//               height: SizeUtils.height,
//               width: double.maxFinite,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                             ImageConstant.imgFour,
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Column(
//                         children :[
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 34.h,
//                               vertical: 41.5.v,
//                             ),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Padding(
//                                     padding: EdgeInsets.only(right: 12.h),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         CustomImageView(
//                                           imagePath: ImageConstant.imgClock,
//                                           height: 24.adaptSize,
//                                           width: 24.adaptSize,
//                                         ),
//                                         CustomImageView(
//                                           imagePath: ImageConstant.imgFiBookmark,
//                                           height: 24.adaptSize,
//                                           width: 24.adaptSize,
//                                           margin: EdgeInsets.only(left: 9.h),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   "Day 01",
//                                   style: CustomTextStyles.titleSmallLightblueA400,
//                                 ),// day 1 headline
//                                 SizedBox(height: 2.v),
//                                 _buildColumnlinefive(context),
//                                 SizedBox(height: 13.v),
//                                 Text(
//                                   "Day 02",
//                                   style: CustomTextStyles.titleSmallLightblueA400,
//                                 ),// day 2 headline
//                                 SizedBox(height: 2.v),
//                                 _buildColumnlinefive(context),
//                                 SizedBox(height: 13.v),
//                                 Text(
//                                   "Day 03",
//                                   style: CustomTextStyles.titleSmallLightblueA400,
//                                 ),//day 3 headline
//                                 SizedBox(height: 2.v),
//                                 _buildColumnlinefive(context),
//
//                               ],
//                             ),
//
//                           ),
//                           Container(
//                               child: Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: _buildColumnfimessage( context),
//                               )
//
//                           )
//                         ],
//                       ),
//                     ),
//
//
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildColumnlinefive(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 1.h),
//       padding: EdgeInsets.symmetric(vertical: 8.v),
//       decoration: AppDecoration.outlineBlack9001.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder9,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(height: 4.v),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.h),
//             child: _buildRowspacerThree(
//               context,
//               mealText: "Meal 01",
//               weightText: "Weight",
//               nutritionalText: "Nutritional Values ",
//             ),
//           ),//meal 1 headline
//           SizedBox(height: 2.v),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20.h,
//               right: 67.h,
//             ),
//             child: _buildRowturkeyburger(
//               context,
//               menuText1: "Salmon  \nBrown Rice\nSliced Almonds",
//               menuText2: "150g\n200g\n30g",
//               menuText3: "Protein: 34g\nCarbs: 33g\nFat: 12g\r",
//             ),
//           ),//meal 1 details
//           SizedBox(height: 2.v),
//           Divider(),
//           SizedBox(height: 2.v),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.h),
//             child: _buildRowspacerThree(
//               context,
//               mealText: "Meal 02",
//               weightText: "Weight",
//               nutritionalText: "Nutritional Values ",
//             ),
//           ), //meal 2 headline
//           SizedBox(height: 2.v),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20.h,
//               right: 67.h,
//             ),
//             child: _buildRowturkeyburger(
//               context,
//               menuText1: "Salmon  \nBrown Rice\nSliced Almonds",
//               menuText2: "150g\n200g\n30g",
//               menuText3: "Protein: 34g\nCarbs: 33g\nFat: 12g\r",
//             ),
//           ), //meal 2 details
//           SizedBox(height: 2.v),
//           Divider(),
//           SizedBox(height: 2.v),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.h),
//             child: _buildRowspacerThree(
//               context,
//               mealText: "Meal 03",
//               weightText: "Weight",
//               nutritionalText: "Nutritional Values ",
//             ),
//           ),//meal 3 headline
//           SizedBox(height: 2.v),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 20.h,
//               right: 67.h,
//             ),
//             child: _buildRowturkeyburger(
//               context,
//               menuText1: "Turkey Burger \nSweet Potato\nGreen Beans",
//               menuText2: "150g\n200g\n150g",
//               menuText3: "Protein: 34g\nCarbs: 51g\nFat: 8g\r",
//             ),
//           )//meal 3 details
//         ],
//       ),//column for meal headline and details
//     );
//   } //full day diet
//
//   /// Section Widget
//   Widget _buildColumnfimessage(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 90.h,
//         vertical: 10.v,
//       ),
//       decoration: AppDecoration.gradientPrimaryContainerToPink,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 12.v),
//           Container(
//             margin: EdgeInsets.only(right: 14.h),
//             padding: EdgeInsets.symmetric(
//               horizontal: 14.h,
//               vertical: 11.v,
//             ),
//             decoration: AppDecoration.outlinePrimary1.copyWith(
//               borderRadius: BorderRadiusStyle.roundedBorder39,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FourScreen(),
//                       ),
//                     );
//                   },
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgFiMessageSquareBlack900,
//                     height: 24.adaptSize,
//                     width: 24.adaptSize,
//                     margin: EdgeInsets.only(
//                       left: 16.h,
//                       top: 17.v,
//                       bottom: 16.v,
//                     ),
//                   ),
//                 ),
//
//                 Spacer(
//                   flex: 59,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FiveScreen(),
//                       ),
//                     );
//                   },
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgFiBookmark,
//                     height: 24.adaptSize,
//                     width: 24.adaptSize,
//                     margin: EdgeInsets.only(
//                       top: 17.v,
//                       bottom: 16.v,
//                     ),
//                   ),
//                 ),
//                 Spacer(
//                   flex: 40,
//                 ),
//                 CustomIconButton(
//                   height: 57.adaptSize,
//                   width: 57.adaptSize,
//                   padding: EdgeInsets.all(16.h),
//                   child: CustomImageView(
//                     imagePath: ImageConstant.imgFiGitlabBlack900,
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   } // footer navigating route
//   /// Common widget
//   Widget _buildRowspacerThree(
//       BuildContext context, {
//         required String mealText,
//         required String weightText,
//         required String nutritionalText,
//       }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           mealText,
//           style: theme.textTheme.labelLarge!.copyWith(
//             color: appTheme.black900,
//           ),
//         ),
//         Spacer(),
//         Text(
//           weightText,
//           style: theme.textTheme.labelLarge!.copyWith(
//             color: appTheme.black900,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 30.h,right: 15.h),
//           child: Text(
//             nutritionalText,
//             style: theme.textTheme.labelLarge!.copyWith(
//               color: appTheme.black900,
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   /// Common widget
//   Widget _buildRowturkeyburger(
//       BuildContext context, {
//         required String menuText1,
//         required String menuText2,
//         required String menuText3,
//       }) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 75.h,
//           child: Text(
//             menuText1,
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: theme.textTheme.bodySmall!.copyWith(
//               color: appTheme.black900,
//             ),
//           ),
//         ),
//         Spacer(
//           flex: 62,
//         ),
//         SizedBox(
//           width: 27.h,
//           child: Text(
//             menuText2,
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: theme.textTheme.bodySmall!.copyWith(
//               color: appTheme.black900,
//             ),
//           ),
//         ),
//         Spacer(
//           flex: 37,
//         ),
//         SizedBox(
//           width: 64.h,
//           child: Text(
//             menuText3,
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: theme.textTheme.bodySmall!.copyWith(
//               color: appTheme.black900,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }




