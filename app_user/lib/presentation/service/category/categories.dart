part of 'category.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>.value(
      value: context.read<CategoriesCubit>()..getCataloguesRequested(),
      child: BlocListener<CategoriesCubit, CategoriesState>(
        listener: (context, state) {},
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          buildWhen: (prev, cur) {
            return prev.catalogues != cur.catalogues ||
                prev.isSubmitting != cur.isSubmitting;
          },
          builder: (context, state) {
            final catalogues = state.catalogues;
            final isSubmitting = state.isSubmitting;

            if (isSubmitting) return const LinearProgressIndicator();

            return SizedBox(
              height: 125,
              child: ListView.separated(
                itemCount: catalogues.length,
                // separatorBuilder: (_, i) => kSpaceZero,
                separatorBuilder: (_, i) => kHSpaceM,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    catalogue: catalogues[index],
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
