
import 'package:intl/message_lookup_by_library.dart';


final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
    "hello": MessageLookupByLibrary.simpleMessage("Xin chào bạn!"),
    "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
    "loginCapitalization": MessageLookupByLibrary.simpleMessage("ĐĂNG NHẬP"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
    "rememberLogin": MessageLookupByLibrary.simpleMessage("Ghi nhớ đăng nhập"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
    "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
    "vehicleAppraisal": MessageLookupByLibrary.simpleMessage("Thẩm định xe"),
    "memberCapitalization": MessageLookupByLibrary.simpleMessage("THÀNH VIÊN"),
    "ordersNew": MessageLookupByLibrary.simpleMessage("Mới"),
    "ordersProcessing": MessageLookupByLibrary.simpleMessage("Đang chờ xử lý"),
    "orderCompleted": MessageLookupByLibrary.simpleMessage("Đã\nhoàn thành"),
    "oderDeclinedCheck": MessageLookupByLibrary.simpleMessage("Từ chối kiểm tra"),
    "search": MessageLookupByLibrary.simpleMessage("Tìm orders"),
    "nameVehicleOwner": MessageLookupByLibrary.simpleMessage("Tên chủ xe"),
    "phoneVehicleOwner": MessageLookupByLibrary.simpleMessage("SĐT"),
    "addressVehicleOwner": MessageLookupByLibrary.simpleMessage("Địa chỉ"),
    "waiting": MessageLookupByLibrary.simpleMessage("Đang chờ"),
    "checking": MessageLookupByLibrary.simpleMessage("Đang kiểm tra"),
    "goCheck": MessageLookupByLibrary.simpleMessage("Đi kiểm tra"),
    "refuse": MessageLookupByLibrary.simpleMessage("Từ chối"),
    "listCheck": MessageLookupByLibrary.simpleMessage("Danh sách chi tiết cần kiểm tra"),
    "information": MessageLookupByLibrary.simpleMessage("Thông tin"),
    "vehicleDocument": MessageLookupByLibrary.simpleMessage("Giấy tờ xe"),
    "importantDetails": MessageLookupByLibrary.simpleMessage("Chi tiết quan trọng"),
    "forItalianSH": MessageLookupByLibrary.simpleMessage("Đối với dòng xe SH Ý"),
    "chassisNumber": MessageLookupByLibrary.simpleMessage("Số khung"),
    "engineNumber": MessageLookupByLibrary.simpleMessage("Số máy"),
    "electricity": MessageLookupByLibrary.simpleMessage("Điện"),
    "fi": MessageLookupByLibrary.simpleMessage("Fi"),
    "sensors": MessageLookupByLibrary.simpleMessage("Cảm biết"),
    "takeATest": MessageLookupByLibrary.simpleMessage("Chạy thử"),
    "additionalDetails": MessageLookupByLibrary.simpleMessage("Chi tiết phụ"),
    "anotherDetails": MessageLookupByLibrary.simpleMessage("Chi tiết khác"),
    "back": MessageLookupByLibrary.simpleMessage("Trở về"),
    "finished": MessageLookupByLibrary.simpleMessage("Đã hoàn thành"),
  };
}