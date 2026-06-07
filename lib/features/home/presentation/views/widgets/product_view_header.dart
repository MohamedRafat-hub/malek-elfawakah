import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/widgets/custom_material_button.dart';

import '../../../../../core/cubits/products_cubit/products_cubit.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength, required this.databaseService});
  final int productsLength;
  final DatabaseService databaseService;

  @override
  Widget build(BuildContext context) {
    final productsCubit = context.read<ProductsCubit>();
    return  Row(
      children: [
        Text(
          '$productsLength  نتائج ',
          textAlign: TextAlign.right,
          style: TextStyle(
            // color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  String selectedSort = 'lowToHigh';

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // يخليه على قد الـ children
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              color: Colors.black,
                              thickness: 3,
                              endIndent: 125,
                              indent: 125,
                            ),
                            const Text(
                              'ترتيب حسب :',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            RadioListTile(
                              title: const Text('السعر (الأقل إلى الأعلى)'),
                              value: 'lowToHigh',
                              groupValue: selectedSort,
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value!;
                                });
                              },
                            ),

                            RadioListTile(
                              title: const Text('السعر (الأعلى إلى الأقل)'),
                              value: 'highToLow',
                              groupValue: selectedSort,
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value!;
                                });
                              },
                            ),

                            RadioListTile(
                              title: const Text('الأبجدية'),
                              value: 'alphabetical',
                              groupValue: selectedSort,
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value!;
                                });
                              },
                            ),

                            CustomMaterialButton(buttonName: 'تطبيق', onPressed: ()async {
                              var data = await databaseService.getData(path: 'products', query: {
                                'orderBy': selectedSort == 'alphabetical' ? 'name' : 'price',
                                'descending': selectedSort == 'highToLow',
                              });
                              List<ProductModel> products = (data as List).map((e) => ProductModel.fromJson(e)).toList();
                              List<ProductEntity> productsAfterSorting = products.map((e) => e.toEntity()).toList();
                              productsCubit.emit(ProductsSuccess(productsAfterSorting));
                              log('Selected Sort: $selectedSort');
                              Navigator.pop(context);
                            }),
                          ],
                        ),
                      );
                    },
                  );
                },
              );            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 0.10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0x66CACECE),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: SvgPicture.asset('assets/icons/filter_icon.svg'),
            ),
          ),
        ),
      ],
    );
  }
}
