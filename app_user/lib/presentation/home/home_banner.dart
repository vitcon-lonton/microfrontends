part of 'home.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<BannersFindCubit>()..findRequested(),
      child: BlocBuilder<BannersFindCubit, BannersFindState>(
          builder: (context, state) {
        return state.maybeWhen(founded: (urls) {
          if (urls.isEmpty()) {
            return kSpaceZero;
          }

          return Padding(
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(height: 300.0),
                  items: urls.asList().map((url) {
                    return DMQImage.network(url, fit: BoxFit.cover);
                  }).toList(),
                ),
              ),
              padding: const EdgeInsets.all(kSpaceM));
        }, inProgress: () {
          return const LinearProgressIndicator();
        }, orElse: () {
          return kSpaceZero;
        });
      }),
    );
  }
}
