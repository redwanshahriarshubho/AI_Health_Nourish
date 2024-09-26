import 'package:flutter/material.dart';
import 'package:health_nourish/presentation/loading_screen/loading_screen.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../six_screen/six_screen.dart';
import '../five_screen/five_screen.dart';
class FourScreen extends StatefulWidget {
  FourScreen({Key? key}) : super(key: key);

  @override
  _FourScreenState createState() => _FourScreenState();
}

class _FourScreenState extends State<FourScreen> {
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    // Add the fixed message to the messages list when the screen is opened
    messages.add("I'd be glad to help you create a muscle-building diet plan for seven days! In order to make sure each meal provides the necessary nutrients, I've designed three meals per day which are slightly diff erent, however, they all contain a good balance of protein, complex carbohydrates, healthy fats, and essential vitamins and minerals. Please note that each meal should be paired with adequate portio of fruits, vegetables, and whole grains to ensure a well-balanced diet.");
  }

  void sendMessage(BuildContext context) {
    String message = messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
        messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.pink5001,
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgFour),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 137.h,
                  height: 30.v,
                  margin: EdgeInsets.only(left: 53.h),
                  child: Text(
                    "Chat with our\n ",
                    maxLines: null,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 2.v),
              Container(
                width: 319.h,
                height: 50.v,
                margin: EdgeInsets.only(left: 52.h, right: 58.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "AI Based Health Assistant\n",
                        style: theme.textTheme.headlineSmall,
                      ),
                      TextSpan(
                        text: " ",
                        style: CustomTextStyles.headlineSmallSemiBold,
                      )
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 21.v),
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    // Set isUserMessage to false for the welcome message
                    bool isUserMessage = index != 0;
                    return MessageBubble(
                      message: message,
                      isUserMessage: isUserMessage,
                    );
                  },
                ),
              ),
              SizedBox(height: 10.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.h),
                child: CustomTextFormField(
                  controller: messageController,
                  hintText: "type your message",
                  textInputAction: TextInputAction.done,
                  suffix: GestureDetector(
                    onTap: () {
                      sendMessage(context);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(12.h, 7.v, 28.h, 7.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgSave,
                        height: 25.adaptSize,
                        width: 25.adaptSize,
                      ),
                    ),
                  ),
                  suffixConstraints: BoxConstraints(maxHeight: 49.v),
                ),
              ),
              //SizedBox(height: 20.v),
              _buildColumnFiMessage(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumnFiMessage(BuildContext context) {
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
                CustomIconButton(
                  height: 57.adaptSize,
                  width: 57.adaptSize,
                  padding: EdgeInsets.all(16.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFiMessageSquare,
                  ),
                ),
                Spacer(
                  flex: 40,
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
                          builder: (context) => SixScreen(),
                        ),
                      );
                    });
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFiGitlab,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 16.h,
                      bottom: 16.v,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isUserMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(48.h, 8.v, 48.h, 8.v),
        padding: EdgeInsets.all(12.0),
        width: 280.h,
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.red.shade200 : Colors.red.shade50,
          borderRadius: BorderRadius.circular(12.0),
        ),

        child: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}



