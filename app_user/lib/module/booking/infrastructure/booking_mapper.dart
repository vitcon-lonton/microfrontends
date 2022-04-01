/* spell-checker: disable */
import '../domain/booking.dart';
import 'api/booking_api.dart';

extension BookingDomainX on BookingDto {
  BookingStatus toStatus() {
    if (status == 'pending') {
      return const BookingStatus.pending();
    }

    if (status == 'accepted') {
      if (statusKtv == 'ktv_find' && statusKh == 'kh_accepted') {
        return const BookingStatus.doing();
      }

      return const BookingStatus.process();
    }

    if (status == 'confirmed') {
      return const BookingStatus.confirm();
    }

    if (status == 'doing') {
      return const BookingStatus.doing();
    }

    if (status == 'process') {
      return const BookingStatus.doing();
    }

    if (status == 'completed') {
      return const BookingStatus.complete();
    }

    if (status == 'cancelled') {
      return const BookingStatus.cancelled();
    }

    return const BookingStatus.pending();
  }

  Booking toDomain() {
    return Booking(
        id: id,
        userId: userId,
        fullName: fullname,
        company: company,
        email: email,
        address: address,
        city: city,
        state: state,
        country: country,
        phoneNumber: phonenumber,
        productList: productList,
        quantity: quantity,
        shippingId: shippingId,
        shippingFee: shippingFee,
        subTotal: subTotal,
        priceTotal: priceTotal,
        clientDevice: clientDevice,
        paymentId: paymentId,
        clientIp: clientIp,
        paymentName: paymentName,
        transactionName: transactionName,
        paidTransaction: paidTransaction,
        paidStatus: paidStatus,
        status: toStatus(),
        remark: remark,
        statusInvestigate: statusInvestigate,
        statusPayment: statusPayment,
        description: description,
        updatedAt: updatedAt,
        createdAt: createdAt,
        priceDiscount: priceDiscount,
        sentMail: sentMail,
        provinceName: provinceName,
        districtName: districtName,
        districtId: districtId,
        categoryId: categoryId,
        wardCode: wardCode,
        wardName: wardName,
        technicianId: technicianId,
        timeBoxingEnd: timeboxingEnd,
        timeBoxingStart: timeboxingStart,
        verifyByAdmin: verifyByAdmin,
        adminNote: adminNote,
        latitude: latitude,
        longitude: longitude,
        deletedAt: deletedAt,
        sku: sku);
  }
}
