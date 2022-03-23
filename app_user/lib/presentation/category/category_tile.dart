part of 'category.dart';

class CategoryTile extends StatelessWidget {
  final Catalogue catalogue;

  const CategoryTile({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = catalogue.name ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kSpaceM),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: 100,
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Theme.of(context).primaryColor))),
              child: const Icon(Icons.category_outlined, size: 60),
              onPressed: () => context.router.push(const ServicesPageRoute()),
            ),
          ),
          kVSpaceXS,
          Text(name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
