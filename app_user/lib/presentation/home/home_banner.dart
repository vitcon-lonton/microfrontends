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
                child: Container(
                  child: DMQImage.network(urls.asList().first),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
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
