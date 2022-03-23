part of 'category.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>.value(
      value: context.read<CategoriesCubit>()..getAllRequested(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
        final isLoading = state.isLoading;
        final catalogues = state.catalogues;

        if (isLoading) return const LinearProgressIndicator();
        if (catalogues.isEmpty()) return kSpaceZero;

        return SizedBox(
          height: 125,
          child: ListView.separated(
            itemCount: catalogues.size,
            // separatorBuilder: (_, i) => kSpaceZero,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, i) => kHSpaceM,
            itemBuilder: (_, i) => CategoryTile(catalogue: catalogues[i]),
          ),
        );
      }, buildWhen: (prev, cur) {
        return prev.catalogues != cur.catalogues ||
            prev.isLoading != cur.isLoading;
      }),
    );
  }
}
