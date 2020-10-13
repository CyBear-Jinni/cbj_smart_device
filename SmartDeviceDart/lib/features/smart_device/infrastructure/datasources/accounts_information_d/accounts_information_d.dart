/// keys to extract account information from the database
class AccountsInformationD {
  static String fireBaseProjectId = 'fireBaseProjectId';
  static String fireBaseApiKey = 'fireBaseApiKey';
  static String userEmail = 'userEmail';
  static String userPassword = 'userPassword';
}

/// firebase Account information
class FirebaseAccountsInformationD {
  FirebaseAccountsInformationD(this.fireBaseProjectId, this.fireBaseApiKey,
      this.userEmail, this.userPassword);

  String fireBaseProjectId;
  String fireBaseApiKey;
  String userEmail;
  String userPassword;

  bool areAllValuesNotNull() {
    return fireBaseProjectId != null &&
        fireBaseApiKey != null &&
        userEmail != null &&
        userPassword != null;
  }
}
