import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/constants/app_strings.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/screens/new_location_screen/widget.dart/input_field.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class NewLocationScreen extends StatefulWidget {
  const NewLocationScreen({Key? key}) : super(key: key);

  @override
  _NewLocationScreenState createState() => _NewLocationScreenState();
}

class _NewLocationScreenState extends State<NewLocationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    personController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                      // whole screen
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.3],
                              colors: Styles.emptyBackgroundColor)),
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: SingleChildScrollView(
                        // to avoid overflow
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultSizedBox.vertical(104.h),
                            InputField(
                                controller: nameController,
                                title: AppStrings.companyName),
                            InputField(
                                controller: addressController,
                                title: AppStrings.companyAddress),
                            InputField(
                                controller: personController,
                                title: AppStrings.pic),
                            InputField(
                                controller: contactController,
                                title: AppStrings.contactNumber),
                            DefaultButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              buttonText: AppStrings.createLocation,
                              borderColor: Styles.profileInfoDark,
                            )
                          ],
                        ),
                      )
                      // const EmptyListDisplay(),
                      ),
                ))
              ],
            ),
            const DefaultAppBar(
              hasBackButton: true,
              // backIcon: AppIcons.cancel,
              titleText: AppStrings.newLocation,
              actionIcons: [],
            )
          ],
        ));
  }
}
