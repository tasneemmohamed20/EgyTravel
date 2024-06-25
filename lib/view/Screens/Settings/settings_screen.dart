import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/view/Screens/Settings/General/general.dart';
import 'package:egy_travel/view/Screens/Settings/Privacy/privacy.dart';
import 'package:egy_travel/view/Widgets/bottom_modal_sheet.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_list_tile.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/UserDataCubit/cubit/profile_cubit.dart';
import 'package:egy_travel/view_model/UserDataCubit/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfile(),
      child: Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        appBar: CustomAppBar(
          title: 'Settings'.tr(),
          enableBack: false,
          leading: backButton(context),
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (previous, current) =>
                  current is Profileloading ||
                  current is ProfileSuccess ||
                  current is ProfileError,
              builder: (context, state) {
                return state.maybeWhen(profileloading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, profileSuccess: (getProfileResponseModel) {
                  var profile = getProfileResponseModel.data!.userData;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(profile!
                                  .avatar ??
                              'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png')),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 16,
                          top: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              profile.name ?? '',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1)),
                            ),
                            Text(
                              profile.email ?? '',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }, profileError: (error) {
                  return Center(
                    child: Text(error.apiErrorModel.message ?? ''),
                  );
                }, orElse: () {
                  return const SizedBox.shrink();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 50.0),
            child: Divider(
              color: ColorsManager.secondPrimary.withOpacity(1),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                CustomListTile(
                    title: 'General'.tr(),
                    hint: "GeneralHint".tr(),
                    elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralSettingse()),
                        ),
                    leadingIcon: Icons.tune_rounded),
                CustomListTile(
                    title: 'Privacy'.tr(),
                    hint: "PrivacyHint".tr(),
                    elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Privacy()),
                        ),
                    leadingIcon: Icons.shield_rounded),
                CustomListTile(
                    title: "AppLanguage".tr(),
                    hint: "AppLanguageHint".tr(),
                    elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                    onTap: () => _showCustomModalSheet(context),
                    leadingIcon: Icons.language)
              ],
            ),
          ),
        ]),
      ),
    ));
  }

  void _showCustomModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true, // Allows for a larger modal sheet
      builder: (context) => CustomModalSheet(),
    );
  }
}
