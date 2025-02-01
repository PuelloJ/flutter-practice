import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/services/local_image_service.dart';
import 'package:image_gallery/ui/ui.dart';
import 'package:image_gallery/ui/widgets/custom_text_field.dart';

class CustomDialogForm extends StatefulWidget {
  const CustomDialogForm({
    super.key,
    required this.addImage,
  });

  final void Function(ImageModel) addImage;

  @override
  State<CustomDialogForm> createState() => _CustomDialogFormState();
}

class _CustomDialogFormState extends State<CustomDialogForm> {
  final _formKey = GlobalKey<FormState>();
  File? imagePath;
  String name = "";
  String autor = "";
  String description = "";
  String? source;
  bool isFavorite = false;
  bool isValidImage = true;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ZoomIn(
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          scrollable: true,
          title: _buildTitle(color, text),
          content: _buildContentForm(),
          actions: _buildActions(context),
        ),
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
        child: const Text("SALIR"),
      ),
      FilledButton(
        style: FilledButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          if (imagePath == null) {
            setState(() {
              isValidImage = false;
            });
          }
          _formKey.currentState!.save();
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            ImageModel imageFromUser = ImageModel.fromUser(
              imagePath,
              name: name,
              author: autor,
              description: description,
              source: source,
              favorite: isFavorite,
            );
            widget.addImage(imageFromUser);
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Imagen Guardada con exito'),
              showCloseIcon: true,
              duration: Duration(milliseconds: 1000),
            ));
          }
        },
        child: const Text("ACEPTAR"),
      ),
    ];
  }

  Widget _buildContentForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: "Ingrese nombre",
            label: "Nombre*",
            icon: const Icon(Icons.abc_outlined),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Ingrese un nombre";
              }
              return null;
            },
            onSaved: (value) {
              name = value!;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            hint: "Ingrese autor",
            label: "Autor*",
            icon: const Icon(Icons.person_add_alt_1_outlined),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Ingrese nombre de autor";
              }
              return null;
            },
            onSaved: (value) {
              autor = value!;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            hint: "Ingrese fuente",
            label: "Fuente",
            icon: const Icon(Icons.source_outlined),
            onSaved: (value) {
              source = value;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            maxLength: 200,
            keyboardType: TextInputType.multiline,
            hint: "Ingrese descripción",
            label: "Descripción*",
            icon: const Icon(Icons.description_outlined),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Ingrese una descripción";
              }
              return null;
            },
            onSaved: (value) {
              description = value!;
            },
          )
        ],
      ),
    );
  }

  Widget _buildTitle(ColorScheme color, TextTheme text) {
    return GestureDetector(
      onTap: () async {
        imagePath = await pickAndSaveImage();
        isValidImage = true;
        setState(() {});
      },
      child: AnimatedContainer(
        height: 300,
        width: 400,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: isValidImage ? color.primary : Colors.redAccent,
            border: Border(
              bottom: BorderSide(
                color: isValidImage ? color.inversePrimary : color.primary,
                width: 2,
              ),
            )),
        child: imagePath != null
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    imagePath!,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton.filled(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.bookmark
                            : Icons.bookmark_add_outlined,
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 50,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Seleccione una imagen",
                        style: text.titleLarge?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  !isValidImage
                      ? Positioned(
                          bottom: 5,
                          left: 10,
                          child: Text(
                            "Debe selecionar una imagen",
                            style: text.bodyMedium,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
      ),
    );
  }
}
