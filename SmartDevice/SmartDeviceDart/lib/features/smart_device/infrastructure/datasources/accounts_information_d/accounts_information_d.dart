// keys to extract account information from the database
class AccountsInformationD {
  static String fireBaseProjectId;
  static String fireBaseApiKey;
  static String userEmail;
  static String userPassword;
}

// firebase Account information
class FirebaseAccountsInformationD {
  String fireBaseProjectId;
  String fireBaseApiKey;
  String userEmail;
  String userPassword;

  FirebaseAccountsInformationD(this.fireBaseProjectId, this.fireBaseApiKey,
      this.userEmail, this.userPassword);

  bool areAllValuesNotNull() {
    return fireBaseProjectId != null &&
        fireBaseApiKey != null &&
        userEmail != null &&
        userPassword != null;
  }
}
