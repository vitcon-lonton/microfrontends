/* spell-checker: disable */
part of 'rating.dart';

class RatingForm extends StatelessWidget {
  const RatingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtSkip = tr(LocaleKeys.txt_skip);
    final txtSubmit = tr(LocaleKeys.txt_submit);
    final txtYourReview = tr(LocaleKeys.txt_your_review);

    return MultiBlocListener(
      listeners: [
        BlocListener<RatingFormCubit, RatingFormState>(listenWhen: (prev, cur) {
          return prev.failureOrSuccessOption != cur.failureOrSuccessOption;
        }, listener: (context, state) {
          state.failureOrSuccessOption.fold(() {}, (either) {
            return either.fold((failure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Server error')));
            }, (_) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Success')));
            });
          });
        }),
      ],
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(children: [
          kVSpaceL,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceL),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(text: tr(LocaleKeys.msg_9)),
                  TextSpan(
                      text: ' 30 ngày ',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                ],
              ),
            ),
          ),
          kVSpaceL,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceL),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(text: tr(LocaleKeys.msg_10)),
                  TextSpan(
                      text: ' Trần Thanh ',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  const TextSpan(text: 'với dịch vụ'),
                  TextSpan(
                      text: ' Sửa điện lạnh ',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                ],
              ),
            ),
          ),

          // POINT
          kVSpaceL,
          BlocBuilder<RatingFormCubit, RatingFormState>(
              buildWhen: (prev, cur) =>
                  prev.point != cur.point ||
                  prev.isSubmitting != cur.isSubmitting,
              builder: (context, state) => RatingBar(
                  itemCount: 5,
                  initialRating: state.point,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  onRatingUpdate: context.read<RatingFormCubit>().pointChanged,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  ratingWidget: RatingWidget(
                      half: Icon(Icons.star_half_rounded,
                          color: Colors.amber.shade400),
                      empty: Icon(Icons.star_outline_rounded,
                          color: Colors.amber.shade400),
                      full: Icon(Icons.star_rate_rounded,
                          color: Colors.amber.shade400)))),

          // CONTENT
          kVSpaceXL,
          BlocBuilder<RatingFormCubit, RatingFormState>(buildWhen: (prev, cur) {
            return prev.isSubmitting != cur.isSubmitting;
          }, builder: (context, state) {
            return SizedBox(
              height: 100,
              child: TextFormField(
                maxLines: 5,
                enabled: !state.isSubmitting,
                validator: (_) => context
                    .read<RatingFormCubit>()
                    .state
                    .content
                    ?.value
                    .fold((failure) {
                  return '// Invalid';
                }, (_) => null),
                decoration: InputDecoration(labelText: txtYourReview),
                onChanged: context.read<RatingFormCubit>().contentChanged,
              ),
            );
          }),

          // BUTTON
          kVSpaceXXL,
          Row(children: [
            kVSpaceM,
            Expanded(
              child: SizedBox(
                height: 52,
                width: double.infinity,
                child: BlocBuilder<RatingFormCubit, RatingFormState>(
                    builder: (context, state) {
                  if (state.isSubmitting) {
                    return TextButton(child: Text(txtSkip), onPressed: null);
                  }

                  return TextButton(
                      child: Text(txtSkip),
                      onPressed: Navigator.of(context).pop);
                }, buildWhen: (prev, cur) {
                  return prev.isSubmitting != cur.isSubmitting;
                }),
              ),
            ),
            kHSpaceL,
            Expanded(
              child: BlocBuilder<RatingFormCubit, RatingFormState>(
                  buildWhen: (prev, cur) {
                return prev.isValid != cur.isValid ||
                    prev.isSubmitting != cur.isSubmitting;
              }, builder: (context, state) {
                if (state.isSubmitting) {
                  return const WSubmitBtn(child: Text('...'), onPressed: null);
                }

                if (state.isValid) {
                  return WSubmitBtn(
                      onPressed: context.read<RatingFormCubit>().submitted,
                      child: Text(txtSubmit));
                }

                return WSubmitBtn(onPressed: null, child: Text(txtSubmit));
              }),
            ),
            kVSpaceM,
          ])
        ]),
      ),
    );
  }
}
