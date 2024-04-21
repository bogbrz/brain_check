import 'dart:io';

import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  File? _selectedImage;
  var isChoosed = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPageCubit, UserPageState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const InitialStateWidget();
          case Status.loading:
            return const LoadingStateWidget();
          case Status.error:
            return ErrorStateWidget(
                errorMessage: state.errorMessage.toString());
          case Status.success:
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(children: <Widget>[
                    CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.2,
                        backgroundImage: state.uploadedImageUrl == null
                            ? null
                            : isChoosed == true && _selectedImage == null
                                ? Image.network(
                                        state.uploadedImageUrl.toString())
                                    .image
                                : _selectedImage != null
                                    ? Image.file(_selectedImage!).image
                                    : Image.network(
                                            state.uploadedImageUrl.toString())
                                        .image),
                    Positioned(
                        left: MediaQuery.of(context).size.width * 0.3,
                        child: IconButton.filledTonal(
                            iconSize: MediaQuery.of(context).size.width * 0.05,
                            onPressed: () async {
                              setState(() {
                                isChoosed = false;
                              });
                              _pickImageFromGallery();

                              print(state.uploadedImageUrl);
                            },
                            icon: Icon(
                              Icons.edit_sharp,
                            )))
                  ]),
                  isChoosed == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<UserPageCubit>()
                                      .uploadImage(file: _selectedImage!)
                                      .then((value) async {
                                    await context
                                        .read<UserPageCubit>()
                                        .getRankingForUpdate(
                                            email:
                                                widget.user!.email.toString());
                                  });
                                },
                                icon: Icon(
                                  Icons.check_box_rounded,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedImage = null;
                                  });
                                },
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ))
                          ],
                        )
                      : SizedBox.shrink(),
                  for (final profile in state.profile) ...[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              "${AppLocalizations.of(context).yourNickName}: ${profile.nickName}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.bungee(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 35)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${AppLocalizations.of(context).yourEmail}: ${widget.user!.email}",
                            style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 35),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${AppLocalizations.of(context).quizPlayerd}: ${profile.gamesPlayed} ",
                            style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 35),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${AppLocalizations.of(context).personalRating}: ${profile.points}",
                            style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 35),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    isChoosed == false
                        ? BlocBuilder<UserPageCubit, UserPageState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<UserPageCubit>()
                                        .updateImageUrl(
                                            imageUrl: state.uploadedImageUrl!,
                                            docId: state.profile[0].id);

                                    setState(() {
                                      isChoosed = true;
                                    });
                                    print("BUTTON ${state.uploadedImageUrl}");
                                  },
                                  child: Text("Accept"));
                            },
                          )
                        : SizedBox.shrink()
                  ],
                ],
              ),
            );
        }
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
