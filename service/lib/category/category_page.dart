import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/category/category_cubit.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryCubit>.value(
      value: context.read<CategoryCubit>()..getAllCatalogues(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Categories')),
        body: BlocListener<CategoryCubit, CategoryState>(
          listener: (context, state) {},
          child: BlocBuilder<CategoryCubit, CategoryState>(
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
                  itemCount: catalogues.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(catalogues[index].name ?? ''),
                      onTap: () {},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
