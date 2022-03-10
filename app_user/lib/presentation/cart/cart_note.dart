/* spell-checker: disable */
part of 'cart.dart';

class CartNote extends StatelessWidget {
  const CartNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpaceS),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: const Color(0xFFFFF2DF)),
      child: Row(
        children: const [
          Icon(Icons.info_outline, color: Color(0xFFC57C39)),
          kHSpaceS,
          Expanded(
            child: Text(
              'Đây là yêu cầu báo giá, sau khi gửi yêu cầu, nhân viên tư vấn sẽ liên hệ chốt giá và lựa chọn kỹ thuật viên phù hợp sau cho từng dịch vụ',
              style: TextStyle(color: Color(0xFFC57C39)),
            ),
          ),
        ],
      ),
    );
  }
}
