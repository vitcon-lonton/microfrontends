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
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          const Center(child: Text('Home')),
          BlocProvider(
            child: const Categories(),
            create: (_) => getIt<CategoriesCubit>(),
          ),
          BlocProvider(
            create: (_) => getIt<ServicesCubit>(),
            child: Expanded(
              child: Services(
                onItemPressed: (service) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ServiceDetail()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
