import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/RadioButtons/radio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomModalSheet extends StatelessWidget {
  CustomModalSheet({super.key});
  final List<String> radioList = ['English'.tr(), 'Arabic'.tr()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonCubit, RadioButtonState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: ColorsManager.primary.withOpacity(1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  height: 5,
                  width: 50,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: ColorsManager.secondPrimary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'AppLanguage'.tr(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.secondPrimary.withOpacity(1),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                      // onTap: () => LocalizationChecker.changeLanguage(context),
                      child: RadioListTile(
                        fillColor: MaterialStateColor.resolveWith((states) =>
                            ColorsManager.secondPrimary.withOpacity(1)),
                        value: index,
                        groupValue: (state is RadioButtonChanged)
                            ? state.selectedIndex
                            : -1,
                        onChanged: (value) {
                          if (value != null) {
                            context
                                .read<RadioButtonCubit>()
                                .selectRadio(value, context);
                          }
                        },
                        title: Text(radioList[index],
                            style: TextStyle(
                                color:
                                    ColorsManager.secondPrimary.withOpacity(1),
                                fontSize: 18)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
