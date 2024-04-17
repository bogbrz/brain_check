import 'dart:io';

import 'package:brain_check/features/pages/set_up_user_page/cubit/set_up_user_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  File? _selectedImage;
  var isChoosed = true;

  @override
  Widget build(BuildContext context) {
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
                isChoosed = false;
              });
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.2,
              backgroundImage: _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                    ).image
                  : null,
              child: _selectedImage == null
                  ? Icon(Icons.add_a_photo)
                  : SizedBox.shrink(),
            ),
          ),
        ),
        isChoosed == false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isChoosed = true;
                        });
                        context
                            .read<SetUpUserCubit>()
                            .uploadImage(file: _selectedImage!);
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
              controller: widget.controller,
            ),
          ),
        ),
      ],
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
