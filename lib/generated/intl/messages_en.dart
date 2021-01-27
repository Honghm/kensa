
import 'package:intl/message_lookup_by_library.dart';


final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
    "hello": MessageLookupByLibrary.simpleMessage("Hello!"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginCapitalization": MessageLookupByLibrary.simpleMessage("LOGIN"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "rememberLogin": MessageLookupByLibrary.simpleMessage("Remember login"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "vehicleAppraisal": MessageLookupByLibrary.simpleMessage("Vehicle appraisal"),
    "memberCapitalization": MessageLookupByLibrary.simpleMessage("MEMBER"),
    "ordersNew": MessageLookupByLibrary.simpleMessage("New"),
    "ordersProcessing": MessageLookupByLibrary.simpleMessage("Processing"),
    "orderCompleted": MessageLookupByLibrary.simpleMessage("Completed"),
    "oderDeclinedCheck": MessageLookupByLibrary.simpleMessage("Declined check"),
    "search": MessageLookupByLibrary.simpleMessage("Search orders"),
    "nameVehicleOwner": MessageLookupByLibrary.simpleMessage("Name owner"),
    "phoneVehicleOwner": MessageLookupByLibrary.simpleMessage("Phone"),
    "addressVehicleOwner": MessageLookupByLibrary.simpleMessage("Address"),
    "waiting": MessageLookupByLibrary.simpleMessage("Waiting"),
    "checking": MessageLookupByLibrary.simpleMessage("Checking"),
    "goCheck": MessageLookupByLibrary.simpleMessage("Go to check"),
    "refuse": MessageLookupByLibrary.simpleMessage("Refuse "),
    "listCheck": MessageLookupByLibrary.simpleMessage("Detailed list to check"),
    "information": MessageLookupByLibrary.simpleMessage("Information"),
    "vehicleDocument": MessageLookupByLibrary.simpleMessage("Vehicle document"),
    "importantDetails": MessageLookupByLibrary.simpleMessage("Important details"),
    "forItalianSH": MessageLookupByLibrary.simpleMessage("For Italian SH models"),
    "chassisNumber": MessageLookupByLibrary.simpleMessage("Chassis number"),
    "engineNumber": MessageLookupByLibrary.simpleMessage("Engine number"),
    "electricity": MessageLookupByLibrary.simpleMessage("Electricity"),
    "fi": MessageLookupByLibrary.simpleMessage("Fi"),
    "sensors": MessageLookupByLibrary.simpleMessage("Sensors"),
    "takeATest": MessageLookupByLibrary.simpleMessage("Take a test"),
    "additionalDetails": MessageLookupByLibrary.simpleMessage("Additional details"),
    "anotherDetails": MessageLookupByLibrary.simpleMessage("Another details"),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "finished": MessageLookupByLibrary.simpleMessage("Finished"),
  };
}