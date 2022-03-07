part of 'home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP_BAR
      appBar: AppBar(title: const Text('Home')),

      // BODY
      body: Column(children: [
        kVSpaceL,
        BlocProvider(
            child: const Categories(), create: (_) => getIt<CategoriesCubit>()),
        BlocProvider(
          create: (_) => getIt<ServicesCubit>(),
          child: Expanded(child: Services(
            onItemPressed: (service) {
              context.router.push(const ServiceBookingPageRoute());
              // context.router.push(const ServiceDetailPageRoute());
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (_) => const ServiceDetail()));
            },
          )),
        )
      ]),

      // FLOATING_ACTION_BUTTON
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.router.push(const CartPageRoute()),
          child: const Icon(Icons.shopping_cart)),
    );
  }
}
