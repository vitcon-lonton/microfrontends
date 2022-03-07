import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/service.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/injection.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>.value(
      value: getIt<CategoriesCubit>()..getCataloguesRequested(),
      child: BlocListener<CategoriesCubit, CategoriesState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: AppBar(title: const Text('Categories')),
          body: ListView(children: [
            BlocBuilder<CategoriesCubit, CategoriesState>(
              buildWhen: (prev, cur) {
                return prev.catalogues != cur.catalogues ||
                    prev.isSubmitting != cur.isSubmitting;
              },
              builder: (context, state) {
                final catalogues = state.catalogues;
                final isSubmitting = state.isSubmitting;

                if (isSubmitting) return const LinearProgressIndicator();

                return SizedBox(
                  height: 130,
                  child: ListView.separated(
                    itemCount: catalogues.length,
                    separatorBuilder: (_, i) => kSpaceZero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final name = catalogues[index].name ?? '';

                      return InkWell(
                        onTap: () {},
                        child: SizedBox.square(
                          dimension: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.category_outlined),
                              kVSpaceM,
                              Text(
                                name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
