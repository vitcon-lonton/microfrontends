part of 'category.dart';

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
          body: ListView(children: const [Categories()]),
        ),
      ),
    );
  }
}
