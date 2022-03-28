part of 'rating.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(LocaleKeys.txt_your_review))),
      body: BlocProvider(
        child: const RatingForm(),
        create: (context) => getIt<RatingFormCubit>(),
      ),
    );
  }
}
