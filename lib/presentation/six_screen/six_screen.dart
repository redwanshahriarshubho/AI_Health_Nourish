import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import '../one_screen/one_screen.dart';
import '../four_screen/four_screen.dart';
import '../five_screen/five_screen.dart';
import '../loading_screen/loading_screen.dart';
class SixScreen extends StatelessWidget {
  const SixScreen({Key? key})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.pink5001,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOne,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Spacer(),
                SizedBox(height: 110.v),
                Text(
                  "User Profile",
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 40.v),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 124.h),
                  padding: EdgeInsets.all(7.h),
                  decoration: AppDecoration.fillOnError.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder91,
                  ),
                  child: Container(
                    height: 168.adaptSize,
                    width: 168.adaptSize,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray10001,
                      borderRadius: BorderRadius.circular(
                        84.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 41.v),
                Text(
                  "Tarif Shahriar Arnob",
                  style: CustomTextStyles.headlineSmallBold,
                ),
                SizedBox(height: 60.v),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 45.h),
                  padding: EdgeInsets.symmetric(vertical: 11.v),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          right: 41.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.v),
                              child: Text(
                                "Email",
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            Text(
                              ": example@gmail.com",
                              style: theme.textTheme.titleSmall,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 9.v),
                      Divider(),
                      SizedBox(height: 8.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 22.h,
                            right: 41.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Phone Number",
                                style: theme.textTheme.titleSmall,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.h),
                                child: Text(
                                  ": +8801xxxxxxxxxxx",
                                  style: theme.textTheme.titleSmall,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Divider(),
                      SizedBox(height: 9.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 22.h),
                          child: Row(
                            children: [
                              Text(
                                "Date of Birth ",
                                style: theme.textTheme.titleSmall,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 33.h),
                                child: Text(
                                  ": 26 Oct 2000",
                                  style: theme.textTheme.titleSmall,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 70.v),
                GestureDetector(
                  onTap: () {
                    // Show loading screen
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const LoadingScreen();
                      },
                    );
                    Future.delayed(const Duration(milliseconds: 200), () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OneScreen(),
                        ),
                      );
                    });
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 66.h),
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgThumbsUp,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Text(
                              "Log Out",
                              style: CustomTextStyles.bodyMedium15.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 75.7.v),
                _buildColumnfimessage(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnfimessage(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 90.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.gradientPrimaryContainerToPink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.v),
          Container(
            margin: EdgeInsets.only(right: 14.h),
            padding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 11.v,
            ),
            decoration: AppDecoration.outlinePrimary1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder39,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Show loading screen
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const LoadingScreen();
                      },
                    );
                    Future.delayed(const Duration(milliseconds: 200), () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FourScreen(),
                        ),
                      );
                    });
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFiMessageSquareBlack900,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(
                      left: 16.h,
                      top: 17.v,
                      bottom: 16.v,
                    ),
                  ),
                ),

                Spacer(
                  flex: 59,
                ),
                  GestureDetector(
                    onTap: () {
                      // Show loading screen
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const LoadingScreen();
                        },
                      );
                      Future.delayed(const Duration(milliseconds: 200), () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FiveScreen(),
                          ),
                        );
                      });
                    },
                child: CustomImageView(
                  imagePath: ImageConstant.imgFiBookmark,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(
                    top: 17.v,
                    bottom: 16.v,
                  ),
                ),
                  ),
                Spacer(
                  flex: 40,
                ),
                CustomIconButton(
                  height: 57.adaptSize,
                  width: 57.adaptSize,
                  padding: EdgeInsets.all(16.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFiGitlabBlack900,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
