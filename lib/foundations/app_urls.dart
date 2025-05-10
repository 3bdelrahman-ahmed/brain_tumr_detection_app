class AppUrls {
  static const String baseUrl =
      "https://neurotumapi-cqf9e4f7ahaxdwbt.uaenorth-01.azurewebsites.net/api/";

  //Auth
  static const String login = "Auth/login";
  static const String registerPatient = "Auth/register/patient";
  static const String registerDoctor = "Auth/register/doctor";
  static const String verifyCode = "Auth/verifyEmail";

  //Clinic
  static const String getClinicSlots  = "Clinic/doctor";
  static const String getDoctorClinics = "Clinic/doctor";
  static const String getAllDoctorsClinics = "Clinic";
  static const String getDoctorReview = "Review/";
  static const String getAvailableSlots  = "Clinic/availableSlots/";
  static const String bookAppointment  = "Appointment";
  static const String addSlot = "Clinic/slot";

  //Chat
  static const String sendMessage = "Chat/sendMessage";
  static const String getUserChats = "Chat";
  static const String getUserConversationMessage = "Chat/";

  // scan 
  static const String cancerPrediction = "cancerPrediction";
}
