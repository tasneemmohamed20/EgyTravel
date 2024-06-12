import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class GeneralSettingse extends StatelessWidget {
  GeneralSettingse({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: 'GeneralSettings'.tr(),
        enableBack: false,
        leading: backButton(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 32.0, vertical: 32),
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 32),
                    child: Center(
                        child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          'https://i.etsystatic.com/19647689/r/il/d67fbb/1891879820/il_570xN.1891879820_eww4.jpg'),
                    )),
                  ),
                  Positioned(
                    // right: 0,
                    bottom: 30,
                    left: MediaQuery.of(context).size.width * 0.46,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsManager
                              .secondPrimary, // Customize as needed
                        ),
                        child: Icon(
                          Icons.edit,
                          color: ColorsManager.primary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              CustomTextField(
                borderColor: ColorsManager.secondPrimary,
                controller: nameController,
                labelText: 'Name'.tr(),
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                borderColor: ColorsManager.secondPrimary,
                controller: emailController,
                labelText: 'Email'.tr(),
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                borderColor: ColorsManager.secondPrimary,
                controller: emailController,
                labelText: 'Address'.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomButton(
                  onPressed: () {},
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 128, vertical: 16),
                  backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
                  text: 'Save'.tr())
            ],
          ),
        ),
      ),
    ));
  }
}
