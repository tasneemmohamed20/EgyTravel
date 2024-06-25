import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/view/Screens/Settings/settings_screen.dart';
import 'package:egy_travel/view/Screens/chatbot.dart';
import 'package:egy_travel/view/Screens/mytrips_screen.dart';
import 'package:egy_travel/view/Screens/profile.dart';
import 'package:egy_travel/view/Screens/test_screen.dart';
import 'package:egy_travel/view/Widgets/shared_list_tile.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/tab_bar.dart';
import 'package:egy_travel/view_model/UserDataCubit/cubit/profile_cubit.dart';
import 'package:egy_travel/view_model/UserDataCubit/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfile(),
      child: Drawer(
          backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
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

                      return DrawerHeader(
                        decoration: BoxDecoration(
                          color: ColorsManager.primary.withOpacity(1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.all(8.0),
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: CachedNetworkImageProvider(
                                      profile!.avatar ??
                                          'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png')),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 16,
                                top: 16,
                              ),
                              child: Text(
                                "Welcome".tr() + (profile.name ?? ''),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.secondPrimary
                                        .withOpacity(1)),
                              ),
                            )
                          ],
                        ),
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
              CustomListTile(
                  leadingIcon: Icons.person_2_rounded,
                  title: "Profile".tr(),
                  elementsColor: ColorsManager.primary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      )),
              CustomListTile(
                  leadingIcon: Icons.map_rounded,
                  title: "MyTrips".tr(),
                  elementsColor: ColorsManager.primary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripsScreen(
                            screenTilte: "MyTrips".tr(),
                          ),
                        ),
                      )),
              CustomListTile(
                  leadingIcon: Icons.favorite_rounded,
                  title: "Favorites".tr(),
                  elementsColor: ColorsManager.primary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Tabs(),
                        ),
                      )),
              CustomListTile(
                  leadingIcon: Icons.settings,
                  title: "Settings".tr(),
                  elementsColor: ColorsManager.primary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      )),
              CustomListTile(
                  leadingIcon: Icons.contact_support_rounded,
                  title: "ContactUs".tr(),
                  elementsColor: ColorsManager.primary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatbotScreen(),
                        ),
                      )),
              const Spacer(),
              CustomListTile(
                  leadingIcon: Icons.logout_rounded,
                  title: "LogOut".tr(),
                  elementsColor: ColorsManager.primary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TestPage(),
                        ),
                      ))
            ],
          )),
    );
  }
}
