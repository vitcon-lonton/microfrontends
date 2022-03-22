part of 'services.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServicesCubit>.value(
        child: Scaffold(
            appBar: AppBar(title: const Text('Services')),
            body: const ServicesWidget()),
        value: getIt<ServicesCubit>()..getServicesRequested());
  }
}
