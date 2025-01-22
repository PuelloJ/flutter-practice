import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery/models/images.dart';
import 'package:image_gallery/services/local_image_service.dart';
import 'package:image_gallery/widgets/shared/custom_text_field.dart';

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
  String? name;
  String? autor;
  String? description;
  String? source;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

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
          title: GestureDetector(
            onTap: () async {
              imagePath = await pickAndSaveImage();
              setState(() {});
            },
            child: imagePath != null
                ? Image.file(
                    width: 400,
                    height: 300,
                    imagePath!,
                    fit: BoxFit.cover,
                  )
                : Container(
                    padding: const EdgeInsets.all(50),
                    color: color.primary,
                    child: Center(
                      child: Column(
                        children: [
                          const Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 50,
                            color: Colors.white70,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Seleccione una imagen",
                            style:
                                text.titleLarge?.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          content: Form(
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
                    name = value;
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
                    autor = value;
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
                    description = value;
                  },
                )
              ],
            ),
          ),
          actions: [
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("SALIR"),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ImageModel image = ImageModel(
                    name: name!,
                    favorite: isFavorite,
                    author: autor!,
                    source: source,
                    description: description!,
                    date: DateTime.now(),
                    imageType: ImageType.file,
                    imageFile: imagePath,
                  );
                  widget.addImage(image);
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
          ],
        ),
      ),
    );
  }
}
