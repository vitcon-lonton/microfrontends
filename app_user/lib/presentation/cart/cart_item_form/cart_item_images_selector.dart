part of 'cart_item_form.dart';

extension XFileX on XFile {
  Future<String> toBase64String() async => base64Encode(await readAsBytes());
}

class CartItemImagesSelector extends StatefulWidget {
  const CartItemImagesSelector({Key? key}) : super(key: key);

  @override
  _CartItemImagesSelectorState createState() => _CartItemImagesSelectorState();
}

class _CartItemImagesSelectorState extends State<CartItemImagesSelector> {
  dynamic _pickImageError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemFormCubit, CartItemFormState>(
        buildWhen: (prev, cur) => prev.base64Images != cur.base64Images,
        builder: (context, state) {
          final itemBase64Images = state.base64Images;
          final base64ImagesImmutable =
              itemBase64Images?.value.fold((failure) => null, (list) => list);

          return Column(children: [
            // LIST IMAGE
            // IMAGE PICKER BUTTON
            Wrap(
                children: [
                  SizedBox.fromSize(
                    size: const Size(165, 116),
                    child: FloatingActionButton(
                      child: const Icon(Icons.photo_library),
                      onPressed: itemBase64Images?.isFull ?? false
                          ? null
                          : _onImageButtonPressed,
                      tooltip: 'Pick Multiple Image from gallery',
                    ),
                  ),
                  ...base64ImagesImmutable?.map((base64Str) {
                        return _itemPreview(base64Str);
                      }).asList() ??
                      const [Text('You have not yet picked an image.')],
                ],
                spacing: kSpaceM,
                runSpacing: kSpaceM,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start),

            // ERROR MESSAGE
            kVSpaceM,
            DefaultTextStyle(
                child: Column(children: [
                  if (itemBase64Images?.isFull ?? false)
                    const Text('Max image you can pick is 6'),
                  if (_pickImageError != null)
                    Text('Pick image error: $_pickImageError'),
                ], crossAxisAlignment: CrossAxisAlignment.start),
                style: const TextStyle(fontSize: 12.5)
                    .copyWith(color: Theme.of(context).errorColor)),
          ], crossAxisAlignment: CrossAxisAlignment.start);
        });
  }

  Widget _itemPreview(String base64Str) {
    return Ink(
      child: Stack(
        children: [
          Image.memory(const Base64Decoder().convert(base64Str),
              width: 165, height: 116, fit: BoxFit.cover),
          CloseButton(onPressed: () => _removeImage(base64Str)),
        ],
      ),
    );
  }

  Future<void> _onImageButtonPressed() async {
    try {
      final pickedFileList = await getIt<ImagePicker>().pickMultiImage();

      if (pickedFileList?.isNotEmpty ?? false) {
        _addImages(pickedFileList!);
      }
    } catch (e) {
      setState(() => _pickImageError = e);
      getIt<Logger>().e(e);
    }
  }

  Future<void> _addImages(List<XFile> files) async {
    List6<String>? base64List6;
    KtList<String> base64Images;

    base64List6 = context.read<CartItemFormCubit>().state.base64Images;

    if (base64List6?.isFull ?? false) return;

    base64Images = base64List6?.getOrCrash() ?? emptyList();

    for (final file in files) {
      String base64Str = await file.toBase64String();
      base64Images = base64Images.plusElement(base64Str);
    }

    List6<String> newBase64List6;
    newBase64List6 = List6(base64Images);
    if (!newBase64List6.isValid()) {
      return;
    }

    context.read<CartItemFormCubit>().imagesChanged(base64Images);
  }

  void _removeImage(String base64Str) async {
    final base64Images = context.read<CartItemFormCubit>().state.base64Images;
    final base64ImmutableList =
        base64Images!.getOrCrash().minusElement(base64Str);

    context.read<CartItemFormCubit>().imagesChanged(base64ImmutableList);
  }
}
