import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_cubit.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>.value(
      value: context.read<CategoriesCubit>()..getAllCatalogues(),
      child: BlocListener<CategoriesCubit, CategoriesState>(
        listener: (context, state) {},
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          buildWhen: (previous, current) {
            return previous.status != current.status ||
                previous.catalogues != current.catalogues;
          },
          builder: (context, state) {
            final status = state.status;
            final catalogues = state.catalogues;

            return status.maybeMap(
              orElse: () => Container(),
              busy: (_) => const LinearProgressIndicator(),
              idle: (_) => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: catalogues.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    title: Text(catalogues[index].name ?? ''),
                    leading: const Icon(Icons.category_outlined),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
