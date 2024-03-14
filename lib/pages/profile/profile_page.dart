import 'dart:ui';

import 'package:cleanserv/pages/profile/add_address/add_address_page.dart';
import 'package:cleanserv/pages/profile/change_password/change_password_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:cleanserv/widgets/profile_widgets/profile_form_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/profile_widgets/profile_form_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(
                    0.7), // Ajusta la opacidad según tus necesidades
                BlendMode.srcATop,
              ),
              child: const ImageHeader(),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.white.withOpacity(0.75),
            ),
          ),
          SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileFormField(
                  image: "assets/images/profile_image.png",
                  opacity: 0.25,
                  hintText: 'First name',
                ),
                const ProfileFormField(
                  image: "assets/images/profile_image.png",
                  opacity: 0.15,
                  hintText: 'Last name',
                ),
                const ProfileFormField(
                  image: "assets/images/phone.png",
                  opacity: 0.15,
                  hintText: 'Phone number',
                ),
                const ProfileFormField(
                  image: "assets/images/email.png",
                  opacity: 0.15,
                  hintText: 'Email',
                ),
                ProfileFormButton(
                  txt: 'Change Password',
                  function: () {
                    Get.to(const ChangePasswordPage());
                  },
                ),
                ProfileFormButton(
                  txt: 'Address',
                  function: () {
                    Get.to(const AddAddressPage());
                  },
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
