import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/auth/register/controller/register_controller.dart';
import 'package:technicmate/features/auth/register/view/register_faculty_view.dart';
import 'package:technicmate/theme/theme.dart';

class RegisterGenderView extends StatelessWidget {
  RegisterGenderView({super.key});
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          AssetConstants.technicMateLogoWhite,
          height: kToolbarHeight / 1.5,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  minRadius: 50,
                  backgroundColor: Palette.white,
                  child: ClipOval(
                    child: Image.network(
                      "https://cdn.iconscout.com/icon/free/png-512/free-person-2653741-2202553.png?f=webp&w=256",
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Hoş geldin!",
                  style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cinsiyet Seç",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: 216,
                          padding: const EdgeInsets.only(top: 6.0),
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
                          ),
                          color: Palette.black,
                          child: SafeArea(
                            top: false,
                            child: CupertinoPicker(
                              itemExtent: 40.0,
                              onSelectedItemChanged: (index) {
                                controller.selectedGender.value = index;
                                print(controller.selectedGender.value);
                              },
                              children: const [
                                Text("Erkek"),
                                Text("Kadın"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFF0A72C6),
                      ),
                      child: Center(
                        child: Obx(
                          () => Text(
                            controller.selectedGender.value == -1
                                ? "CinsiyetSec"
                                : controller.selectedGender.value == 0
                                    ? "Erkek"
                                    : "Kadın",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  children: [
                    GlowButton(
                      color: Palette.loginButtonDarkBlueColor,
                      glowColor: Palette.loginButtonDarkBlueColor,
                      borderRadius: BorderRadius.circular(16),
                      width: 110,
                      height: 34,
                      onPressed: () {},
                      child: Text(
                        "Geri dön",
                        style: GoogleFonts.inter(fontSize: 14),
                      ),
                    ),
                    GlowButton(
                      color: Palette.loginButtonBlueColor,
                      glowColor: Palette.loginButtonBlueColor,
                      borderRadius: BorderRadius.circular(16),
                      width: 110,
                      height: 34,
                      onPressed: () async {
                        print(controller.universityId);
                        print(controller.registerNameController.text);
                        print(controller.registerSurnameController.text);
                        print(controller.selectedDate.value);
                        print(controller.selectedGender.value);
                        await controller.getDepatments(controller.universityId);
                        Get.to(() => RegisterFacultyView());
                      },
                      child: Text(
                        "Devam Et",
                        style: GoogleFonts.inter(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
