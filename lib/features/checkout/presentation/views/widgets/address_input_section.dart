import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        children: [
          CustomTextFormField(hintText: 'الاسم بالكامل', keyboardType: TextInputType.text),
          CustomTextFormField(hintText: 'البريد الالكتروني', keyboardType: TextInputType.text),
          CustomTextFormField(hintText: ' العنوان', keyboardType: TextInputType.text),
          CustomTextFormField(hintText: 'المدينة', keyboardType: TextInputType.text),
          CustomTextFormField(hintText: 'رقم الهاتف', keyboardType: TextInputType.text),
          CustomTextFormField(hintText: 'رقم الطابق , رقم الشقة', keyboardType: TextInputType.text),
        ],
      ),
    );
  }
}
