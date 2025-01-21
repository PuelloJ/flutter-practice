import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery/widgets/shared/custom_text_field.dart';

class CustomDialogForm extends StatelessWidget {
  const CustomDialogForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme.primary;

    return ZoomIn(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        clipBehavior: Clip.antiAlias,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        contentPadding: const EdgeInsets.all(0),
        actions: [
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Text("Aceptar"),
            ),
          )
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   image.imageUrl,
            //   fit: BoxFit.cover,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                
                child: Column(
                  children: [
                    CustomTextFormField(
                      hint: "Ingrese nombre",
                      label: "Nombre",
                      validator: (String? value) {
                        if (value == null && value!.isEmpty) {
                          return "Ingrese un valor valido";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      hint: "Ingrese nombre",
                      label: "Nombre",
                      validator: (String? value) {
                        if (value == null && value!.isEmpty) {
                          return "Ingrese un valor valido";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      hint: "Ingrese nombre",
                      label: "Nombre",
                      validator: (String? value) {
                        if (value == null && value!.isEmpty) {
                          return "Ingrese un valor valido";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      hint: "Ingrese nombre",
                      label: "Nombre",
                      validator: (String? value) {
                        if (value == null && value!.isEmpty) {
                          return "Ingrese un valor valido";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
