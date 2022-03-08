part of 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY
      body: SingleChildScrollView(
        child: Column(children: [
          // BANNER
          ...[
            Padding(
              padding: const EdgeInsets.all(kSpaceM),
              child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Container(
                      child: const Icon(Icons.abc_rounded),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Theme.of(context).primaryColor))),
            ),
          ],

          // BLOGS
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            kVSpaceM,
            _title('Blogs', onTapSeeMore: () {
              context.router.push(const ArticlesPageRoute());
            }),
            kVSpaceM,
            BlocProvider(
              create: (_) => getIt<ArticlesCubit>(),
              child: const SizedBox(
                height: 130,
                child: Articles(
                  isPagination: false,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            kVSpaceM,
          ],

          // CATEGORIES
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            kVSpaceM,
            _title('Categories'),
            kVSpaceM,
            BlocProvider(
              child: const Categories(),
              create: (_) => getIt<CategoriesCubit>(),
            ),
            kVSpaceM,
          ],

          // SERVICES
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            kVSpaceM,
            BlocProvider(
              create: (_) => getIt<ServicesCubit>(),
              child: Services(
                isPagination: false,
                onItemPressed: (service) =>
                    context.router.push(const ServiceBookingPageRoute()),
              ),
            ),
            kVSpaceM,
          ],

          // SERVICES
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            kVSpaceM,
            BlocProvider(
              create: (_) => getIt<ServicesCubit>(),
              child: Services(
                isPagination: false,
                onItemPressed: (service) =>
                    context.router.push(const ServiceBookingPageRoute()),
              ),
            ),
            kVSpaceM,
            kVSpaceL,
          ],
        ]),
      ),

      // FLOATING_ACTION_BUTTON
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () => context.router.push(const CartPageRoute())),

      // APP_BAR
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => context.router.push(const SettingsPageRoute()),
        ),
        // leading: const Icon(Icons.person),
        title: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => kSpaceZero,
              authenticated: (_) => Row(children: const [Text('Alvin')]),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              context.router.push(const NotificationsPageRoute());
            },
          ),
          kHSpaceM,
        ],
      ),
    );
  }

  Widget _title(String text, {VoidCallback? onTapSeeMore}) {
    return Row(
      children: [
        kHSpaceM,
        DefaultTextStyle(
            maxLines: 1,
            child: Text(text),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall!),
        const Spacer(),
        if (onTapSeeMore != null) Link(text: 'See more', onTap: onTapSeeMore),
        kHSpaceM,
      ],
    );
  }
}
