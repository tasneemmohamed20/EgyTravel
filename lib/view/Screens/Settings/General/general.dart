import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/model/Profile/get_profile_response.dart';
import 'package:egy_travel/view/Widgets/edit_bloc_listener.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/EditProfile/cubit/edit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralSettings extends StatelessWidget {
  final GetProfileResponseModel profileModel;

  GeneralSettings({super.key, required this.profileModel});
  final TextEditingController emailController = TextEditingController();
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
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 32),
                    child: Center(
                        child: CircleAvatar(
                      radius: 70,
                      backgroundImage: CachedNetworkImageProvider(profileModel
                              .data!.userData!.avatar ??
                          'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
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
                        child: IconButton(
                          onPressed: () => context
                              .read<EditCubit>()
                              .pickImageFromGallery(),
                          icon: const Icon(Icons.edit_rounded),
                          color: ColorsManager.primary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                },
                controller: context.read<EditCubit>().nameController,
                labelText: 'Name'.tr(),
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid Email';
                  }
                },
                controller: context.read<EditCubit>().emailController,
                labelText: 'Email'.tr(),
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid address';
                  }
                },
                controller: context.read<EditCubit>().addressController,
                labelText: 'Address'.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomButton(
                  onPressed: () {
                    if (context.read<EditCubit>().nameController.text == '') {
                      context.read<EditCubit>().nameController.text =
                          profileModel.data!.userData!.name!;
                    } else if (context
                            .read<EditCubit>()
                            .emailController
                            .text ==
                        '') {
                      context.read<EditCubit>().emailController.text =
                          profileModel.data!.userData!.email!;
                    } else if (context
                            .read<EditCubit>()
                            .addressController
                            .text ==
                        '') {
                      context.read<EditCubit>().addressController.text =
                          profileModel.data!.userData!.address!;
                    }
                    context
                        .read<EditCubit>()
                        .updateProfile(profileModel.data!.userData!.avatar!);
                  },
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 128, vertical: 16),
                  backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
                  text: 'Save'.tr()),
              const EditBlocListener()
            ],
          ),
        ),
      ),
    ));
  }
}
