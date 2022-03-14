/* spell-checker: disable */
part of 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback(
    //     (_) => context.router.push(const ServiceBookingPageRoute()));
  }

  @override
  Widget build(BuildContext context) {
    final txtBlogs = tr(LocaleKeys.txt_blogs);
    final txtWelcomeToSHOME = tr(LocaleKeys.txt_welcome_to_shome);

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

          // IMAGE
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            const Padding(
              child: ImageSelectorSmall(),
              padding: EdgeInsets.symmetric(horizontal: kSpaceM),
            ),
          ],

          // BLOGS
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            kVSpaceM,
            _title(txtBlogs, onTapSeeMore: () {
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
            BlocProvider.value(
                child: const Categories(), value: getIt<CategoriesCubit>()),
            kVSpaceM,
          ],

          // SERVICES
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            kVSpaceM,
            BlocProvider.value(
                value: getIt<ServicesCubit>(),
                child: const Services(isPagination: false)),
            kVSpaceM,
          ],

          // SERVICES
          ...[
            const Divider(height: 8.0, thickness: 8.0),
            kVSpaceM,
            BlocProvider(
              create: (_) => getIt<ServicesCubit>(),
              child: const Services(isPagination: false),
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
        leading: Padding(
          padding: const EdgeInsets.only(left: kSpaceXS),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) => IconButton(
              icon: const CircleAvatar(
                  backgroundColor: Color(0xFFE6E6E6),
                  child: Icon(Icons.person, size: 20, color: Colors.grey)),
              onPressed: () => context.router.push(const SettingsPageRoute()),
            ),
          ),
        ),
        title: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            }

            final userName =
                state.user?.name.value.foldRight(null, (name, prev) => name);

            if (userName == null) {
              return Row(children: [Text(txtWelcomeToSHOME)]);
            }

            return Row(children: [Text('Hi, $userName')]);
          },
        ),
        // title: BlocBuilder<AuthBloc, AuthState>(
        //   builder: (context, state) {
        //     return state.maybeMap(
        //       orElse: () => kSpaceZero,
        //       authenticated: (_) => Row(children: const [Text('Alvin')]),
        //     );
        //   },
        // ),
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
        if (onTapSeeMore != null)
          Link(text: tr(LocaleKeys.txt_view_all), onTap: onTapSeeMore),
        kHSpaceM,
      ],
    );
  }
}
