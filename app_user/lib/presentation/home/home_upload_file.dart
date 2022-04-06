part of 'home.dart';

class HomeImgUpload extends StatefulWidget {
  const HomeImgUpload({Key? key}) : super(key: key);

  @override
  _HomeImgUploadState createState() => _HomeImgUploadState();
}

class _HomeImgUploadState extends State<HomeImgUpload> {
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
                  _previewImages(),
                  const Icon(Icons.camera_alt_sharp,
                      size: 105, color: Colors.white54),
                ]),
              ),
            ),
          ),
        ),
      ),
      _getRetrieveErrorWidget(),
      kVSpaceM,
      ElevatedButton(
        child: const Text('Upload'),
        onPressed: () async {
          // final fileName = _imageFile!.name;
          // final bytes = await _imageFile!.readAsBytes();
          // final bytesCast = bytes.cast<int>();
          // bytes.

          // html.File(bytesCast, fileName);

          if (!kIsWeb) {
            context
                .read<UploadFilesCubit>()
                .uploaded([io.File(_imageFile!.path)]);
          }
          // context.read<UploadFilesCubit>().uploaded([File(bytes, fileName)]);
        },
      ),
      kVSpaceM,
      BlocBuilder<UploadFilesCubit, UploadFilesState>(
          builder: (context, state) {
        return state.maybeWhen(uploadSuccess: (urls) {
          return Row(
              children: urls.asList().map((url) {
            return DMQImage.network(url, fit: BoxFit.cover);
          }).toList());
          // return Text('Success ${urls.size}');
        }, uploadFailure: () {
          return const Text('Upload Failure');
        }, orElse: () {
          return kSpaceZero;
        });
      }),
      kVSpaceM,
    ]);
  }

  Future<void> _onImageButtonPressed() async {
    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
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
      return Image.file(io.File(_imageFile!.path), fit: BoxFit.cover);
    } else {
      return kSpaceZero;
    }
  }
}
