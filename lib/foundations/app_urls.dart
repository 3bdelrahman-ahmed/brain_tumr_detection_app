class AppUrls {
  static const String baseUrl =
      "https://neurotumapi-cqf9e4f7ahaxdwbt.uaenorth-01.azurewebsites.net/api/";

  //Auth
  static const String login = "Auth/login";
  static const String registerPatient = "Auth/register/patient";
  static const String registerDoctor = "Auth/register/doctor";
  static const String verifyCode = "Auth/verifyEmail";
  static const String forgetPassword = "Auth/forgetPassword";
  static const String verifyForgetPassword = "Auth/verifyForgetPassword";
  static const String resetPassword = "Auth/resetPassword";
  static const String addReview = "review";

  //Clinic
  static const String getClinicSlots = "Clinic/doctor";
  static const String getDoctorClinics = "Clinic/doctor";
  static const String getAllDoctorsClinics = "Clinic";
  static const String getDoctorReview = "Review/";
  static const String getAvailableSlots = "Clinic/availableSlots/";
  static const String bookAppointment = "Appointment";
  static const String addSlot = "Clinic/slot";
  static const String deleteSlot = "Clinic/slot/";
  static const String editSlot = "Clinic/slot/";
  static const String assignedScans = "MriScan/assignedScans";
  static const String getDoctorById = "Doctor/";
  static const String addClinic = "Clinic";


  //Chat
  static const String sendMessage = "Chat/sendMessage";
  static const String getUserChats = "Chat";
  static const String getUserConversationMessage = "Chat/";

  // scan
  static const String uploadScan = "MriScan/upload";
  static const String reviewScan = "MriScan/review";

  static const String getScans = "MriScan";


  //Patient
  static String getPatients(String id) => "Appointment/doctor/$id";
  static String getBookedAppointments = "Appointment";

  static String getConversationId(String patientId) => "Chat/user/$patientId";
  static const String getPatientAppointments = "Appointment";
  static const String deleteAppointment = "Appointment/cancel";

  //Notification
  static const String getNotifications = "Notification";
  static const String sendDeviceToken = "UserDeviceToken";

  // contact us
  static const String contactUs = "ContactUs";


  // feed 
  static const String post = "Post";
  static const String toggleLike = "Post/toggleLike";
  static const String toggleSave = "Post/toggleSave";
  static const String comments = "Post/comments";
  static const String addComment = "Post/comment";
  static const String savedPosts = "Post/saved";

  //Account
static const String editProfile = "Account/profilePicture";
}
