/* spell-checker: disable */

import '../domain/booking_entities.dart';
import 'api/booking_api.dart';

extension BookingDomainX on BookingDto {
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
        status: status,
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
        serviceId: serviceId,
        latitude: latitude,
        longitude: longitude,
        deletedAt: deletedAt,
        sku: sku,
        serviceList: serviceList);
  }
}
