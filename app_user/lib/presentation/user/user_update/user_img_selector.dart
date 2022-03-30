part of 'user_update.dart';

class UserImgSelector extends StatefulWidget {
  const UserImgSelector({Key? key}) : super(key: key);

  @override
  _UserImgSelectorState createState() => _UserImgSelectorState();
}

class _UserImgSelectorState extends State<UserImgSelector> {
  XFile? _imageFile;
  dynamic _pickImageError;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(150),
            color: Theme.of(context).primaryColor.withOpacity(0.2)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: InkWell(
            borderRadius: BorderRadius.circular(150),
            onTap: () {
              _onImageButtonPressed();
            },
            child: DefaultTextStyle(
              style: const TextStyle(),
              textAlign: TextAlign.center,
              child: Ink(
                child: Stack(alignment: Alignment.center, children: [
                  !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                      ? FutureBuilder<void>(
                          future: retrieveLostData(),
                          builder: (context, AsyncSnapshot<void> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                              case ConnectionState.done:
                                return _previewImages();
                              default:
                                if (snapshot.hasError) {
                                  return Text(
                                    'Pick image/video error: ${snapshot.error}}',
                                  );
                                } else {
                                  return const Text(
                                    'You have not yet picked an image.',
                                  );
                                }
                            }
                          },
                        )
                      : _previewImages(),
                  const Icon(Icons.camera_alt_sharp,
                      size: 105, color: Colors.white54),
                ]),
              ),
            ),
          ),
        ),
      ),
      _getRetrieveErrorWidget(),
    ]);
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  Future<void> _onImageButtonPressed() async {
    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });

      context.read<UserUpdateCubit>().imageChanged(pickedFile);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Widget _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    } else if (_pickImageError != null) {
      return Text('Pick image error: $_pickImageError');
    } else if (_imageFile == null) {
      return const Text('You have not yet picked an image.');
    }

    return kSpaceZero;
  }

  Widget _previewImages() {
    if (_imageFile != null) {
      if (kIsWeb) {
        return Image.network(_imageFile!.path, fit: BoxFit.cover);
      }
      return Image.file(File(_imageFile!.path), fit: BoxFit.cover);
    } else {
      return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        return state.maybeWhen(founded: (user) {
          return user.image == null
              ? kSpaceZero
              : DMQImage.network(user.image!, fit: BoxFit.cover);
        }, orElse: () {
          return kSpaceZero;
        });
      });
    }
  }
}
