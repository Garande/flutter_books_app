import 'dart:io';

import 'package:book_mate/generated/app_localizations.dart';
import 'package:book_mate/models/app_user.dart';
import 'package:book_mate/utils/constants.dart';
import 'package:book_mate/utils/helpers.dart';
import 'package:book_mate/views/sign_in/cubit/sign_in_cubit.dart';
import 'package:book_mate/views/widgets/app_button.dart';
import 'package:book_mate/views/widgets/app_textfield.dart';
import 'package:book_mate/views/widgets/avatar.dart';
import 'package:book_mate/views/widgets/selectable_app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CompleteAuthView extends StatefulWidget {
  CompleteAuthView({Key? key}) : super(key: key);

  @override
  State<CompleteAuthView> createState() => _CompleteAuthViewState();
}

class _CompleteAuthViewState extends State<CompleteAuthView> {
  File? image;
  String? photoUrl;

  List gender = ["MALE", "FEMALE"];

  String? selectedGender;

  bool isLoading = false;

  DateTime startDate = DateTime.now();

  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  DateTime? dateOfBirth;

  final dateOfBithController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void didChangeDependencies() {
    populateView();
    super.didChangeDependencies();
  }

  void populateView() {
    String name = context.read<SignInCubit>().state.account?.displayName ?? '';
    List<String> nameSplit = name.split(' ');
    firstNameController.text = nameSplit[0];
    nameSplit.removeAt(0);
    lastNameController.text = nameSplit.join(' ');
    emailController.text =
        context.read<SignInCubit>().state.account?.email ?? '';
    photoUrl = context.read<SignInCubit>().state.account?.photoUrl;
    // dateOfBithController.text = context.read<SignInCubit>().state.account?.
  }

  void showCalender({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1920),
      initialDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        dateOfBirth = picked;
        dateOfBithController.text = Helpers.formatDateMonth(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.padding,
        vertical: AppConstants.padding,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.085),
            _buildHeader(context),
            const SizedBox(height: 10),
            _buildMessageView(context),
            const SizedBox(height: 10),
            _buildUserAvatar(context),
            const SizedBox(height: 10),
            AppTextField(
              label: AppLocalizations.of(context)!.firstName,
              hintText: AppLocalizations.of(context)!.firstName,
              controller: firstNameController,
            ),
            const SizedBox(height: 10),
            AppTextField(
              label: AppLocalizations.of(context)!.lastName,
              hintText: AppLocalizations.of(context)!.lastName,
              controller: lastNameController,
            ),
            const SizedBox(height: 10),
            AppTextField(
              label: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.email,
              controller: emailController,
            ),
            const SizedBox(height: 10),
            SelectableAppTextField(
              label: AppLocalizations.of(context)!.dob,
              hintText: AppLocalizations.of(context)!.dob,
              onTap: () {
                showCalender(context: context);
              },
              controller: dateOfBithController,
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.gender,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(),
                ),
                //Use the above widget where you want the radio button
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      addRadioButton(
                          0, AppLocalizations.of(context)!.male, context),
                      addRadioButton(
                          1, AppLocalizations.of(context)!.female, context),
                    ],
                  ),
                )
              ],
            ),
            AppTextField(
              label: AppLocalizations.of(context)!.bio,
              hintText: AppLocalizations.of(context)!.enter_about,
              controller: bioController,
            ),
            const SizedBox(height: 10),
            AppButton(
              text: AppLocalizations.of(context)!.finish,
              isOutlined: false,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorLight,
                ],
                stops: [0.0, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: () {
                String userId =
                    '${context.read<SignInCubit>().state.country?.code}${context.read<SignInCubit>().state.phoneNumber}';
                userId.replaceAll(' ', '');
                AppUser user = AppUser(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  dateOfBirthTimeMillis: dateOfBirth?.millisecondsSinceEpoch,
                  imageUrl: photoUrl,
                  phoneNumber: context.read<SignInCubit>().state.phoneNumber,
                  countryCode:
                      context.read<SignInCubit>().state.country?.dialCode,
                  bio: bioController.text,
                  gender: selectedGender,
                  creationDateTimeMillis: DateTime.now().millisecondsSinceEpoch,
                  id: userId,
                );
                context.read<SignInCubit>().saveUserProfile(user);
              },
            ),
          ],
        ),
      ),
    );
  }

  RichText _buildMessageView(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.complete_profile_msg,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.complete_profile,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        // const Icon(Icons.menu),
      ],
    );
  }

  Row _buildUserAvatar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Avatar(
              size: 110,
              photoUrl: photoUrl ??
                  'https://www.goodmorninghdloveimages.com/wp-content/uploads/2020/04/Whatsapp-Profile-Photo-Download-7.jpg',
            ),
            Positioned(
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2.5,
                    color: Colors.white,
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).primaryColor,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              top: 0,
              right: 0,
            )
          ],
        ),
      ],
    );
  }

  Row addRadioButton(int btnValue, String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<String>(
          activeColor: Theme.of(context).colorScheme.secondary,
          value: gender[btnValue],
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 14.0,
              ),
        )
      ],
    );
  }
}
