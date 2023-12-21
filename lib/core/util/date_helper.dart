import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateHelper {
  String getLongFormDate(Timestamp timestamp) {
    // Convert the Firebase Timestamp to a DateTime object
    DateTime dateTime = timestamp.toDate();

    // Use DateFormat from the intl package to format the DateTime
    // You can change the pattern to suit your needs
    String formattedDate = DateFormat('dd MMM, yyyy').format(dateTime);

    return formattedDate;
  }
}
