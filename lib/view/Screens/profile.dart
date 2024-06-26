import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/model/Profile/get_profile_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/profile_details.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final GetProfileResponseModel profileModel;
  const ProfileScreen({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsManager.primary.withOpacity(1),
          appBar: CustomAppBar(
            title: 'Profile'.tr(),
            enableBack: false,
            leading: backButton(context),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 32.0),
                child: Center(
                    child: CircleAvatar(
                  radius: 70,
                  backgroundImage: CachedNetworkImageProvider(profileModel
                          .data!.userData!.avatar ??
                      'https://i.etsystatic.com/19647689/r/il/d67fbb/1891879820/il_570xN.1891879820_eww4.jpg'),
                )),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 16),
                child: Center(
                  child: Text(profileModel.data!.userData!.name ?? '',
                      style: TextStyle(
                          fontSize: 25,
                          color: ColorsManager.secondPrimary.withOpacity(1),
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ProfileDetail(
                  label: 'Email'.tr(),
                  value: profileModel.data!.userData!.email ?? ''),
              Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 8.0),
                  child: Divider(
                    color: ColorsManager.secondPrimary.withOpacity(1),
                    thickness: 0.5,
                    indent: MediaQuery.of(context).size.width * 0.1,
                    endIndent: MediaQuery.of(context).size.width * 0.1,
                  )),
              ProfileDetail(
                  label: 'Address'.tr(),
                  value: profileModel.data!.userData!.address ?? ''),
            ],
          )),
    );
  }
}
