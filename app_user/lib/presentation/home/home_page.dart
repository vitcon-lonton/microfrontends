/* spell-checker: disable */
part of 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final txtBlogs = tr(LocaleKeys.txt_blogs);
    final txtWelcomeToSHOME = tr(LocaleKeys.txt_welcome_to_shome);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<BannersFindCubit>()),
      ],
      child: Scaffold(
        // BODY
        body: SingleChildScrollView(
          child: Column(children: [
            // BANNER
            const HomeBanner(),

            // IMAGE
            const BookingTimeForm(),
            // TimeIntervalPicker(
            //   endLimit: null,
            //   startLimit: null,
            //   onChanged:
            //       (DateTime? startTime, DateTime? endTime, bool isAllDay) {},
            // ),

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
              BlocProvider.value(
                child: const SizedBox(
                  child: Articles(
                      isPagination: false, scrollDirection: Axis.horizontal),
                  height: 130,
                ),
                value: getIt<ArticlesCubit>(),
              ),
              kVSpaceM,
            ],

            // CATEGORIES
            ...[
              const Divider(height: 8.0, thickness: 8.0),
              kVSpaceM,
              BlocProvider.value(
                  child: const CategoriesWidget(),
                  value: getIt<CategoriesCubit>()),
              kVSpaceM,
            ],

            // SERVICES
            ...[
              const Divider(height: 8.0, thickness: 8.0),
              kVSpaceM,
              BlocProvider.value(
                  value: getIt<ServicesCubit>(),
                  child: const ServicesWidget(isPagination: false)),
              kVSpaceM,
            ],

            // SERVICES
            ...[
              const Divider(height: 8.0, thickness: 8.0),
              kVSpaceM,
              BlocProvider(
                create: (_) => getIt<ServicesCubit>(),
                child: const ServicesWidget(isPagination: false),
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

        // APP BAR
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: kSpaceXS),
            child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
              return state.maybeWhen(founded: (user) {
                if (user.image == null) {
                  return IconButton(
                    icon: const CircleAvatar(
                        backgroundColor: Color(0xFFE6E6E6),
                        child:
                            Icon(Icons.person, size: 20, color: Colors.grey)),
                    onPressed: () {
                      context.router.push(const SettingsPageRoute());
                    },
                  );
                }

                return IconButton(
                  icon: ClipRRect(
                      child: DMQImage.network(user.image!),
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                    context.router.push(const SettingsPageRoute());
                  },
                );
              }, orElse: () {
                return IconButton(
                  icon: const CircleAvatar(
                      backgroundColor: Color(0xFFE6E6E6),
                      child: Icon(Icons.person, size: 20, color: Colors.grey)),
                  onPressed: () =>
                      context.router.push(const SettingsPageRoute()),
                );
              });
            }),
          ),
          title: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
            return state.maybeWhen(inProgress: () {
              return const CircularProgressIndicator();
            }, founded: (user) {
              return Row(children: [
                Text('Hi, ${user.name.value.getOrElse(() => '')}'),
              ]);
            }, orElse: () {
              return Row(children: [Text(txtWelcomeToSHOME)]);
            });
          }),
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
