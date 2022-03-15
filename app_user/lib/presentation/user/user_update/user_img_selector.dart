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
    return Container(
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
            _onImageButtonPressed(ImageSource.gallery);
          },
          child: DefaultTextStyle(
            style: const TextStyle(),
            textAlign: TextAlign.center,
            child: Ink(
              child: Stack(
                alignment: Alignment.center,
                children: [
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
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

  Future<void> _onImageButtonPressed(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    } else if (_imageFile != null) {
      if (kIsWeb) {
        return Image.network(_imageFile!.path, fit: BoxFit.cover);
      }
      return Image.file(File(_imageFile!.path), fit: BoxFit.cover);
    } else if (_pickImageError != null) {
      return Text('Pick image error: $_pickImageError');
    } else {
      return const Text('You have not yet picked an image.');
    }
  }
}
