import 'dart:io';

import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart';

import 'package:firebase_auth/firebase_auth.dart';
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
  final controller = TextEditingController();
  File? _selectedImage;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  var isEditing = false;
  var uploaded = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserPageCubit>()
        ..getRankingForUpdate(
            email: widget.user!.email.toString(), userId: widget.user!.uid),
      child: BlocConsumer<UserPageCubit, UserPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          print("CHOODES ${_selectedImage}");
          print("USER NOT FB ${widget.user}");
          print(
              "DISPLAY useer  USERPAGE FB : ${FirebaseAuth.instance.currentUser}");
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton.filledTonal(
                            iconSize: MediaQuery.of(context).size.width * 0.05,
                            onPressed: () async {
                              setState(() {
                                isEditing = true;
                              });
                              print(isEditing);
                            },
                            icon: Icon(
                              Icons.edit_sharp,
                            ))
                      ],
                    ),
                    InkWell(
                      onTap: isEditing == false
                          ? null
                          : () {
                              _pickImageFromGallery();

                              print("CHOODES ${_selectedImage}");
                            },
                      child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.2,
                          backgroundImage: state.uploadedImageUrl == null &&
                                  isEditing == false
                              ? null
                              : isEditing == false &&
                                      _selectedImage == null &&
                                      state.uploadedImageUrl != null
                                  ? Image.network(
                                          state.uploadedImageUrl.toString())
                                      .image
                                  : _selectedImage != null && isEditing == true
                                      ? Image.file(_selectedImage!).image
                                      : _selectedImage != null &&
                                              isEditing == false
                                          ? Image.file(_selectedImage!).image
                                          : Image.network(state.uploadedImageUrl
                                                  .toString())
                                              .image),
                    ),
                    for (final profile in state.profile) ...[
                      Row(
                        children: [
                          isEditing == false
                              ? Expanded(
                                  child: Text(
                                      "${AppLocalizations.of(context).yourNickName}: ${profile.nickName}",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.bungee(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              35)))
                              : Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                "${AppLocalizations.of(context).yourNickName}: ",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.bungee(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            35)),
                                          ],
                                        ),
                                        TextField(
                                          maxLength: 13,
                                          style: GoogleFonts.bungee(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  35),
                                          decoration: InputDecoration(
                                            hintText: profile.nickName,
                                            hintStyle: GoogleFonts.bungee(),
                                          ),
                                          controller: controller,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
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
                      isEditing == true
                          ? ElevatedButton(
                              onPressed: () {
                                // _selectedImage == null &&
                                //         controller.text.isNotEmpty
                                //     ? context
                                //         .read<UserPageCubit>()
                                //         .updateProfile(
                                //             nickName:
                                //                 controller.text.isEmpty
                                //                     ? profile.nickName
                                //                     : controller.text,
                                //             imageUrl:
                                //                 state.uploadedImageUrl!,
                                //             docId: state.profile[0].id)
                                //         .then((value) {
                                //         setState(() {
                                //           isEditing = false;
                                //         });
                                //         print("KONTROLER $controller.");
                                //         controller.clear();
                                //       })
                                //     :
                                context
                                    .read<UserPageCubit>()
                                    .uploadImage(file: _selectedImage)
                                    .then((value) {
                                  context.read<UserPageCubit>().updateProfile(
                                      imageUrl: state.uploadedImageUrl!,
                                      docId: state.profile[0].id,
                                      nickName: controller.text.isEmpty
                                          ? profile.nickName
                                          : controller.text);
                                  setState(() {
                                    isEditing = false;
                                  });
                                });

                                // _selectedImage != null
                                //     ?
                                // context
                                //         .read<UserPageCubit>()
                                //         .uploadImage(file: _selectedImage!)
                                //         .then((value) async {
                                //         await context
                                //             .read<UserPageCubit>()
                                //             .getRankingForUpdate(
                                //                 email: widget.user!.email
                                //                     .toString());
                                //       }).then((value) {
                                //         context
                                //             .read<UserPageCubit>()
                                //             .updateProfile(
                                //                 nickName:
                                //                     controller.text.isEmpty
                                //                         ? profile.nickName
                                //                         : controller.text,
                                //                 imageUrl:
                                //                     state.uploadedImageUrl!,
                                //                 docId: state.profile[0].id)
                                //             .then((value) {
                                //           setState(() {
                                //             isEditing = false;
                                //           });
                                //         });
                                //       })
                                //     : context
                                //         .read<UserPageCubit>()
                                //         .updateProfile(
                                //             nickName:
                                //                 controller.text.isEmpty
                                //                     ? profile.nickName
                                //                     : controller.text,
                                //             imageUrl:
                                //                 state.uploadedImageUrl!,
                                //             docId: state.profile[0].id)
                                //         .then((value) {
                                //         setState(() {
                                //           isEditing = false;
                                //         });
                                //       });

                                print("BUTTON ${state.uploadedImageUrl}");
                              },
                              child: Text("Accept"))
                          : SizedBox.shrink()
                    ],
                  ],
                ),
              );
          }
        },
      ),
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
