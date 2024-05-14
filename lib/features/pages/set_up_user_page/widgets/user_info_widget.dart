import 'dart:io';

import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/features/pages/set_up_user_page/cubit/set_up_user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({super.key, required this.user});

  final User? user;

  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

final controller = TextEditingController();

class _UserInfoWidgetState extends State<UserInfoWidget> {
  File? _selectedImage;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetUpUserCubit, SetUpUserState>(
      builder: (context, state) {
       

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).addProfilePictrue,
              style: GoogleFonts.bungee(fontSize: 20),
            ),
            Material(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.22,
              ),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  _pickImageFromGallery();
                  setState(() {
                 
                  });
                },
                child: ProfilePictureWidget(selectedImage: _selectedImage),
              ),
            ),
          
            Text(
              AppLocalizations.of(context).setNickName,
              style: GoogleFonts.bungee(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  maxLength: 13,
                  style: GoogleFonts.bungee(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).nickName,
                    hintStyle: GoogleFonts.bungee(),
                  ),
                  controller: controller,
                ),
              ),
            ),
            InkWell(
                onTap: controller.text.isEmpty ||
                        state.profile.any(
                            (element) => element.nickName == controller.text)
                    ? null
                    : () async {
                        await context
                            .read<SetUpUserCubit>()
                            .uploadImage(file: _selectedImage!)
                            .then((value) {
                          context
                              .read<SetUpUserCubit>()
                              .addProfileToGlobalRanking(
                                  imageUrl: state.uploadImageUrl,
                                  nickName: controller.text.isNotEmpty
                                      ? controller.text
                                      : widget.user!.displayName.toString(),
                                  email: widget.user!.email.toString(),
                                  userId: widget.user!.uid);
                        });

                        controller.clear();
                        context.goNamed("/homePage", extra: widget.user);
                      },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.05),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(180, 53, 94, 197),
                        ],
                      ),
                    ),
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context).set,
                      style: GoogleFonts.bungee(fontSize: 25),
                    ))))
          ],
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
    required File? selectedImage,
  }) : _selectedImage = selectedImage;

  final File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetUpUserCubit, SetUpUserState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const InitialStateWidget();
          case Status.loading:
            return const LoadingPictureWidget();

          case Status.error:
            return ErrorStateWidget(
                errorMessage: state.errorMessage.toString());
          case Status.success:
            return CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.2,
              backgroundImage: _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                    ).image
                  : state.uploadImageUrl == null
                      ? null
                      : Image.network(state.uploadImageUrl!).image,
              child: _selectedImage == null && state.uploadImageUrl == null
                  ? const Icon(Icons.add_a_photo)
                  : const SizedBox.shrink(),
            );
        }
      },
    );
  }
}
