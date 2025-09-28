import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/common_widgets/app_loading_dialog_widget.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/bloc/create_product_bloc.dart';
import 'package:flutter_ims/utils/extension.dart';

class ProductBasicInfoWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController categoryController;
  final TextEditingController skuController;

  const ProductBasicInfoWidget({
    super.key,
    required this.categoryController,
    required this.nameController,
    required this.skuController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateProductBloc, CreateProductState>(
      listenWhen:
          (previous, current) =>
              previous.getCategoriesStatus != current.getCategoriesStatus,
      listener: (context, state) async {
        if (state.getCategoriesStatus == GetCategoriesStatus.loading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const AppLoadingDialogWidget();
            },
          );
          return;
        }

        if (state.getCategoriesStatus == GetCategoriesStatus.success) {
          Navigator.pop(context);
          final String? selectedCategory = await showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap:
                        () => Navigator.pop(
                          context,
                          state.categories[index].name,
                        ),
                    title: Text(state.categories[index].name),
                  );
                },
              );
            },
          );

          if (selectedCategory != null) {
            categoryController.text = selectedCategory;
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                context.l10n.basic_info,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppTextFormFieldWidget(
                controller: nameController,
                label: Text(context.l10n.name),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormFieldWidget(
                      controller: skuController,
                      label: Text(
                        "${context.l10n.sku}/${context.l10n.barcode}",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.barcode_reader),
                  ),
                ],
              ),
              AppTextFormFieldWidget(
                controller: categoryController,
                label: Text(context.l10n.categories),
                suffixIcon: const Icon(Icons.keyboard_arrow_down),
                readOnly: true,
                onTap: () {
                  context.read<CreateProductBloc>().add(
                    const OnPressedCategoryEvent(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
