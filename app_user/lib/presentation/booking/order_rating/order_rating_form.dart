/* spell-checker: disable */
part of 'order_rating.dart';

class OrderRatingForm extends StatelessWidget {
  const OrderRatingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderRatingCubit, OrderRatingState>(
      listenWhen: (prev, cur) =>
          prev.failureOrSuccessOption != cur.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(() {}, (either) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: const Text('Server error'),
                  action: SnackBarAction(label: 'Action', onPressed: () {}),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              (_) {
                Navigator.of(context).pop();

                final snackBar = SnackBar(
                    content: const Text('Success'),
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(label: 'Action', onPressed: () {}));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          );
        });
      },
      child: Form(
        autovalidateMode:
            context.read<OrderRatingCubit>().state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
        child: Column(children: [
          kVSpaceL,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceL),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  const TextSpan(
                      text:
                          'Đơn hàng hoàn thành, mời bạn để lại đánh giá về kỹ thuật viên'),
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

          kVSpaceL,
          BlocBuilder<OrderRatingCubit, OrderRatingState>(
              buildWhen: (prev, cur) =>
                  prev.point != cur.point ||
                  prev.isSubmitting != cur.isSubmitting,
              builder: (context, state) => RatingBar(
                  itemCount: 5,
                  initialRating: state.point,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  onRatingUpdate: context.read<OrderRatingCubit>().pointChanged,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  ratingWidget: RatingWidget(
                      half: Icon(Icons.star_half_rounded,
                          color: Colors.amber.shade400),
                      empty: Icon(Icons.star_outline_rounded,
                          color: Colors.amber.shade400),
                      full: Icon(Icons.star_rate_rounded,
                          color: Colors.amber.shade400)))),

          kVSpaceXL,
          BlocBuilder<OrderRatingCubit, OrderRatingState>(
              buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
              builder: (context, state) => WTextInput(
                  height: 100,
                  maxLines: 5,
                  label: 'Your Review',
                  enabled: state.isSubmitting,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0))),

          // onChanged: context.read<OrderRatingCubit>().phoneChanged,
          kVSpaceM,
          kVSpaceM,
          kVSpaceM,
          Row(children: [
            kVSpaceM,
            Expanded(
              child: BlocBuilder<OrderRatingCubit, OrderRatingState>(
                  buildWhen: (prev, cur) =>
                      prev.isSubmitting != cur.isSubmitting,
                  builder: (_, state) => SizedBox(
                      height: 52,
                      width: double.infinity,
                      child: TextButton(
                          child: const Text('SKIP'),
                          onPressed: state.isSubmitting
                              ? null
                              : () => Navigator.of(context).pop()))),
            ),
            kHSpaceL,
            Expanded(
              child: BlocBuilder<OrderRatingCubit, OrderRatingState>(
                  buildWhen: (prev, cur) =>
                      prev.isSubmitting != cur.isSubmitting,
                  builder: (_, state) => WSubmitBtn(
                      child: Text(state.isSubmitting ? '...' : 'SEND'),
                      onPressed: state.isSubmitting
                          ? null
                          : context.read<OrderRatingCubit>().submitted)),
            ),
            kVSpaceM,
          ])
        ]),
      ),
    );
  }
}
