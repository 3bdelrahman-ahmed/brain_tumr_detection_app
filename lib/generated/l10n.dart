// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `NeuroTum AI`
  String get appName {
    return Intl.message(
      'NeuroTum AI',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Kindly complete the fields below with the relevant details of your clinic.`
  String get kindlyCompleteTheForm {
    return Intl.message(
      'Kindly complete the fields below with the relevant details of your clinic.',
      name: 'kindlyCompleteTheForm',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// 'No Data Available'
  String get noDataAvailable {
    return Intl.message(
      'Clinic Name',
      name: 'clinicName',
      desc: '',
      args: [],
    );
  }

  /// `No Reports Yet`
  String get noReportsYet {
    return Intl.message(
      'No Reports Yet',
      name: 'noReportsYet',
      desc: '',
      args: [],
    );
  }

  /// `No Doctors Found`
  String get noDoctorsFound {
    return Intl.message(
      'No Doctors Found',
      name: 'noDoctorsFound',
      desc: '',
      args: [],
    );
  }

  /// `Clinic License`
  String get clinicLicense {
    return Intl.message(
      'Clinic License',
      name: 'clinicLicense',
      desc: '',
      args: [],
    );
  }

  /// `noSearchResultsFor`
  String get noSearchResultsFor {
    return Intl.message(
      'No search results for ',
      name: 'noSearchResultsFor',
      desc: '',
      args: [],
    );
  }

  /// noChats
  String get noChats {
    return Intl.message(
      'No Chats',
      name: 'noChats',
      desc: '',
      args: [],
    );
  }

  /// `No Appointments`
  String get noAppointments {
    return Intl.message(
      'No Appointments',
      name: 'noAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Phone Number`
  String get clinicPhoneNumber {
    return Intl.message(
      'Clinic Phone Number',
      name: 'clinicPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Clinic Phone Number`
  String get enterYourClinicPhoneNumber {
    return Intl.message(
      'Enter your Clinic Phone Number',
      name: 'enterYourClinicPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Search for posts`
  String get searchForPosts {
    return Intl.message(
      'Search for posts',
      name: 'searchForPosts',
      desc: '',
      args: [],
    );
  }

  /// `Search for therapist`
  String get searchForTherapist {
    return Intl.message(
      'Search for therapist',
      name: 'searchForTherapist',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upComing {
    return Intl.message(
      'Upcoming',
      name: 'upComing',
      desc: '',
      args: [],
    );
  }

  /// `Tap to attach file`
  String get tapToAttachFile {
    return Intl.message(
      'Tap to attach file',
      name: 'tapToAttachFile',
      desc: '',
      args: [],
    );
  }

  /// `Biometric Authentication Enabled`
  String get biometricAuthenticationEnabled {
    return Intl.message(
      'Biometric Authentication Enabled',
      name: 'biometricAuthenticationEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Remmber Me`
  String get remmberMe {
    return Intl.message(
      'Remmber Me',
      name: 'remmberMe',
      desc: '',
      args: [],
    );
  }

  /// `New Slot`
  String get newSlot {
    return Intl.message(
      'New Slot',
      name: 'newSlot',
      desc: '',
      args: [],
    );
  }

  /// `Add Slots`
  String get addSlots {
    return Intl.message(
      'Add Slots',
      name: 'addSlots',
      desc: '',
      args: [],
    );
  }

  /// `Slot removed`
  String get slotRemoved {
    return Intl.message(
      'Slot removed',
      name: 'slotRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Set Your Time`
  String get setYourDate {
    return Intl.message(
      'Set Your Time',
      name: 'setYourDate',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotIt {
    return Intl.message(
      'Got it',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `Next time you login, you can use your fingerprint or face ID to access your account.`
  String get nextTimeYouLogin {
    return Intl.message(
      'Next time you login, you can use your fingerprint or face ID to access your account.',
      name: 'nextTimeYouLogin',
      desc: '',
      args: [],
    );
  }

  /// `Success Operation`
  String get sucessOpertation {
    return Intl.message(
      'Success Operation',
      name: 'sucessOpertation',
      desc: '',
      args: [],
    );
  }

  /// `Didn't get the code? `
  String get didnotGetCode {
    return Intl.message(
      'Didn\'t get the code? ',
      name: 'didnotGetCode',
      desc: '',
      args: [],
    );
  }

  /// `Write a message...`
  String get writeAMessage {
    return Intl.message(
      'Write a message...',
      name: 'writeAMessage',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resendCodeAgain {
    return Intl.message(
      'Resend code',
      name: 'resendCodeAgain',
      desc: '',
      args: [],
    );
  }

  /// `tap to select your gender`
  String get tapToSelectYourGender {
    return Intl.message(
      'tap to select your gender',
      name: 'tapToSelectYourGender',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Saved Posts`
  String get savedPosts {
    return Intl.message(
      'Saved Posts',
      name: 'savedPosts',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Name: `
  String get name {
    return Intl.message(
      'Name: ',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `What is happening?`
  String get whatIsHappening {
    return Intl.message(
      'What is happening?',
      name: 'whatIsHappening',
      desc: '',
      args: [],
    );
  }

  /// `Availability`
  String get availability {
    return Intl.message(
      'Availability',
      name: 'availability',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Gender: `
  String get gender {
    return Intl.message(
      'Gender: ',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Submitted: `
  String get submitted {
    return Intl.message(
      'Submitted: ',
      name: 'submitted',
      desc: '',
      args: [],
    );
  }

  /// `Age: `
  String get age {
    return Intl.message(
      'Age: ',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Medical History `
  String get medicalHistory {
    return Intl.message(
      'Medical History ',
      name: 'medicalHistory',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth:`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth:',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Click on a day to show available time slots`
  String get clickOnTheDayToShow {
    return Intl.message(
      'Click on a day to show available time slots',
      name: 'clickOnTheDayToShow',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Location: `
  String get location {
    return Intl.message(
      'Location: ',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Sessions: `
  String get sessions {
    return Intl.message(
      'Sessions: ',
      name: 'sessions',
      desc: '',
      args: [],
    );
  }

  /// `Country: `
  String get country {
    return Intl.message(
      'Country: ',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Experience: `
  String get experience {
    return Intl.message(
      'Experience: ',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `View Profile`
  String get viewProfile {
    return Intl.message(
      'View Profile',
      name: 'viewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Viewed`
  String get viewed {
    return Intl.message(
      'Viewed',
      name: 'viewed',
      desc: '',
      args: [],
    );
  }

  /// `Sessions(s)`
  String get session {
    return Intl.message(
      'Sessions(s)',
      name: 'session',
      desc: '',
      args: [],
    );
  }

  /// `Please enter verification code`
  String get pinFieldError {
    return Intl.message(
      'Please enter verification code',
      name: 'pinFieldError',
      desc: '',
      args: [],
    );
  }

  /// `View Profile`
  String get viewProf {
    return Intl.message(
      'View Profile',
      name: 'viewProf',
      desc: '',
      args: [],
    );
  }

  /// `Open PDF`
  String get openPdf {
    return Intl.message(
      'Open PDF',
      name: 'openPdf',
      desc: '',
      args: [],
    );
  }

  /// `View Report`
  String get viewReport {
    return Intl.message(
      'View Report',
      name: 'viewReport',
      desc: '',
      args: [],
    );
  }

  /// `Report Is Ready!`
  String get reportIsReady {
    return Intl.message(
      'Report Is Ready!',
      name: 'reportIsReady',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Verification Code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter the Verification Code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Upload your File here`
  String get uploadYourFileHere {
    return Intl.message(
      'Upload your File here',
      name: 'uploadYourFileHere',
      desc: '',
      args: [],
    );
  }

  /// `Hey there! To help you find the best doctors near you, we need location access. Please enable it in settings!`
  String get openLocationPermission {
    return Intl.message(
      'Hey there! To help you find the best doctors near you, we need location access. Please enable it in settings!',
      name: 'openLocationPermission',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Rescheduled`
  String get reScheduled {
    return Intl.message(
      'Rescheduled',
      name: 'reScheduled',
      desc: '',
      args: [],
    );
  }

  /// `Supported Files: pdf, png`
  String get supportedFiles {
    return Intl.message(
      'Supported Files: pdf, png',
      name: 'supportedFiles',
      desc: '',
      args: [],
    );
  }

  /// `Your file is being uploaded`
  String get yourFileIsBeingUploaded {
    return Intl.message(
      'Your file is being uploaded',
      name: 'yourFileIsBeingUploaded',
      desc: '',
      args: [],
    );
  }

  /// `Your File Name`
  String get yourFileName {
    return Intl.message(
      'Your File Name',
      name: 'yourFileName',
      desc: '',
      args: [],
    );
  }

  /// `MRI Uploaded Successfully!`
  String get mriFileUploaded {
    return Intl.message(
      'MRI Uploaded Successfully!',
      name: 'mriFileUploaded',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get returnPage {
    return Intl.message(
      'Return',
      name: 'returnPage',
      desc: '',
      args: [],
    );
  }

  /// `done`
  String get done {
    return Intl.message(
      'done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message(
      'Doctor',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis`
  String get diagnosis {
    return Intl.message(
      'Diagnosis',
      name: 'diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message(
      'Result',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Findings`
  String get findings {
    return Intl.message(
      'Findings',
      name: 'findings',
      desc: '',
      args: [],
    );
  }

  /// `Contact Patient`
  String get contactPatient {
    return Intl.message(
      'Contact Patient',
      name: 'contactPatient',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSetting {
    return Intl.message(
      'Account Settings',
      name: 'accountSetting',
      desc: '',
      args: [],
    );
  }

  /// `Notifications Settings`
  String get notificationsSettings {
    return Intl.message(
      'Notifications Settings',
      name: 'notificationsSettings',
      desc: '',
      args: [],
    );
  }

  /// `Medical Data Management`
  String get medicalDataManagement {
    return Intl.message(
      'Medical Data Management',
      name: 'medicalDataManagement',
      desc: '',
      args: [],
    );
  }

  /// `Support & Feedback`
  String get supportFeedback {
    return Intl.message(
      'Support & Feedback',
      name: 'supportFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Reasoning`
  String get reasoning {
    return Intl.message(
      'Reasoning',
      name: 'reasoning',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your medical certificate`
  String get documentError {
    return Intl.message(
      'Please enter your medical certificate',
      name: 'documentError',
      desc: '',
      args: [],
    );
  }

  /// `Credentials`
  String get credentials {
    return Intl.message(
      'Credentials',
      name: 'credentials',
      desc: '',
      args: [],
    );
  }

  /// `Upload your medical license (e.g. MOH, DHA, HAAD, SCFHS, or equivalent)`
  String get uploadYourNationalMedical {
    return Intl.message(
      'Upload your medical license (e.g. MOH, DHA, HAAD, SCFHS, or equivalent)',
      name: 'uploadYourNationalMedical',
      desc: '',
      args: [],
    );
  }

  /// `Medical Certificate Front Image`
  String get medicalCertificateFrontImage {
    return Intl.message(
      'Medical Certificate Front Image',
      name: 'medicalCertificateFrontImage',
      desc: '',
      args: [],
    );
  }

  /// `Medical Certificate Back Image`
  String get medicalCertificateBackImage {
    return Intl.message(
      'Medical Certificate Back Image',
      name: 'medicalCertificateBackImage',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your credentials (medical license, certification, or hospital ID) to verify your physician status.`
  String get pleaseUploadYourCredentials {
    return Intl.message(
      'Please upload your credentials (medical license, certification, or hospital ID) to verify your physician status.',
      name: 'pleaseUploadYourCredentials',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a notification once your report is ready.\nThank you for your patience.`
  String get youWillRecieveNotificationSoon {
    return Intl.message(
      'You will receive a notification once your report is ready.\nThank you for your patience.',
      name: 'youWillRecieveNotificationSoon',
      desc: '',
      args: [],
    );
  }

  /// ` must contain letters and exactly one space between first and last name`
  String get fullNameMustContainOneSpace {
    return Intl.message(
      ' must contain letters and exactly one space between first and last name',
      name: 'fullNameMustContainOneSpace',
      desc: '',
      args: [],
    );
  }

  /// `Profile Image`
  String get profileImage {
    return Intl.message(
      'Profile Image',
      name: 'profileImage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your location`
  String get locationError {
    return Intl.message(
      'Please enter your location',
      name: 'locationError',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account ? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `select Gender`
  String get selectGender {
    return Intl.message(
      'select Gender',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `set Location`
  String get setLocation {
    return Intl.message(
      'set Location',
      name: 'setLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select Date of Birth`
  String get selectDateOfBirth {
    return Intl.message(
      'Select Date of Birth',
      name: 'selectDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birthDate {
    return Intl.message(
      'Birth Date',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Start!`
  String get letsStart {
    return Intl.message(
      'Let’s Start!',
      name: 'letsStart',
      desc: '',
      args: [],
    );
  }

  /// `Almost there! We’ve sent a code to your email to verify your identity. Just enter it below to reset your password..`
  String get verificationCodeSenatce {
    return Intl.message(
      'Almost there! We’ve sent a code to your email to verify your identity. Just enter it below to reset your password..',
      name: 'verificationCodeSenatce',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get createYourAcc {
    return Intl.message(
      'Create Your Account',
      name: 'createYourAcc',
      desc: '',
      args: [],
    );
  }

  /// `Welcome aboard! Let’s get you set up so we can start helping you with your brain health journey.`
  String get welcomeAbroadSentence {
    return Intl.message(
      'Welcome aboard! Let’s get you set up so we can start helping you with your brain health journey.',
      name: 'welcomeAbroadSentence',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Your Password?`
  String get forgetYourPassword {
    return Intl.message(
      'Forgot Your Password?',
      name: 'forgetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `welcome back,`
  String get welcomeBack {
    return Intl.message(
      'welcome back,',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry! We’ll help you get back into your account in no time`
  String get dontWorryPassword {
    return Intl.message(
      'Don’t worry! We’ll help you get back into your account in no time',
      name: 'dontWorryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Full name`
  String get enterYourFullName {
    return Intl.message(
      'Enter your Full name',
      name: 'enterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Username`
  String get enterYourUserName {
    return Intl.message(
      'Enter your Username',
      name: 'enterYourUserName',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Hey there! Ready to pick up where you left off ? Log in to continue your health journey`
  String get heyThereLogin {
    return Intl.message(
      'Hey there! Ready to pick up where you left off ? Log in to continue your health journey',
      name: 'heyThereLogin',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `As a Patient`
  String get asAPatient {
    return Intl.message(
      'As a Patient',
      name: 'asAPatient',
      desc: '',
      args: [],
    );
  }

  /// `As a Physician`
  String get asADoctor {
    return Intl.message(
      'As a Physician',
      name: 'asADoctor',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to NeuroTum`
  String get firstOnBoardingMessage {
    return Intl.message(
      'Welcome to NeuroTum',
      name: 'firstOnBoardingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Set Your Location`
  String get setYourLocation {
    return Intl.message(
      'Set Your Location',
      name: 'setYourLocation',
      desc: '',
      args: [],
    );
  }

  /// `To help you find doctors near you and provide recommendations, we need to know your location.`
  String get toHelpYouFindDoctors {
    return Intl.message(
      'To help you find doctors near you and provide recommendations, we need to know your location.',
      name: 'toHelpYouFindDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Hello there! 🌟 You've just taken the first step toward understanding your health better. Let's uncover what's going on in your brain—our smart technology is here to guide you.`
  String get firstOnBoardingSentence {
    return Intl.message(
      'Hello there! 🌟 You\'ve just taken the first step toward understanding your health better. Let\'s uncover what\'s going on in your brain—our smart technology is here to guide you.',
      name: 'firstOnBoardingSentence',
      desc: '',
      args: [],
    );
  }

  /// `Detecting Brain Tumors`
  String get secondOnBoardingMessage {
    return Intl.message(
      'Detecting Brain Tumors',
      name: 'secondOnBoardingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your brain is unique, and so is our detection system. Using cutting-edge tech, we'll analyze your symptoms and help spot potential issues early. Think of it as a virtual check-up—fast, simple, and secure.`
  String get secondOnBoardingSentence {
    return Intl.message(
      'Your brain is unique, and so is our detection system. Using cutting-edge tech, we\'ll analyze your symptoms and help spot potential issues early. Think of it as a virtual check-up—fast, simple, and secure.',
      name: 'secondOnBoardingSentence',
      desc: '',
      args: [],
    );
  }

  /// `Find the Right Doctor`
  String get thirdOnBoardingMessage {
    return Intl.message(
      'Find the Right Doctor',
      name: 'thirdOnBoardingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Need expert care? We'll connect you with the best doctors near you based on your location. No endless searching or stress—just trusted professionals who can help you take the next step.`
  String get thirdOnBoardingSentence {
    return Intl.message(
      'Need expert care? We\'ll connect you with the best doctors near you based on your location. No endless searching or stress—just trusted professionals who can help you take the next step.',
      name: 'thirdOnBoardingSentence',
      desc: '',
      args: [],
    );
  }

  /// `Instant Diagnosis Results`
  String get fourthOnBoardingMessage {
    return Intl.message(
      'Instant Diagnosis Results',
      name: 'fourthOnBoardingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your results are in! 🚀 Don't worry, we'll break it down simply for you. While this isn't a final diagnosis, it's a great way to get insights and understand what's happening. Ready to dive in?`
  String get fourthOnBoardingSentence {
    return Intl.message(
      'Your results are in! 🚀 Don\'t worry, we\'ll break it down simply for you. While this isn\'t a final diagnosis, it\'s a great way to get insights and understand what\'s happening. Ready to dive in?',
      name: 'fourthOnBoardingSentence',
      desc: '',
      args: [],
    );
  }

  /// `Privacy First`
  String get fifthOnBoardingMessage {
    return Intl.message(
      'Privacy First',
      name: 'fifthOnBoardingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your privacy matters—always. Your data is safe with us, encrypted, and only shared with your consent. You're in control, every step of the way.`
  String get fifthOnBoardingSentence {
    return Intl.message(
      'Your privacy matters—always. Your data is safe with us, encrypted, and only shared with your consent. You\'re in control, every step of the way.',
      name: 'fifthOnBoardingSentence',
      desc: '',
      args: [],
    );
  }

  /// `Let's Get Started`
  String get sixthOnBoardingMessage {
    return Intl.message(
      'Let\'s Get Started',
      name: 'sixthOnBoardingMessage',
      desc: '',
      args: [],
    );
  }

  /// `All set to begin? We'll need just a few details to personalize your experience. It's quick and easy—let's go!`
  String get sixthOnBoardingSentence {
    return Intl.message(
      'All set to begin? We\'ll need just a few details to personalize your experience. It\'s quick and easy—let\'s go!',
      name: 'sixthOnBoardingSentence',
      desc: '',
      args: [],
    );
  }

  /// `Please enter `
  String get pleaseEnter {
    return Intl.message(
      'Please enter ',
      name: 'pleaseEnter',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get invalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordLenghtError {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordLenghtError',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get passwordMustContainAtLeastOneUpperCaseLetter {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'passwordMustContainAtLeastOneUpperCaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get passwordMustContainAtLeastOneDigit {
    return Intl.message(
      'Password must contain at least one number',
      name: 'passwordMustContainAtLeastOneDigit',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character`
  String get passwordMustContainAtLeastOneSpecialCharacter {
    return Intl.message(
      'Password must contain at least one special character',
      name: 'passwordMustContainAtLeastOneSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password does not match`
  String get confirmPasswordNotMatch {
    return Intl.message(
      'Confirm password does not match',
      name: 'confirmPasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone Number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid Phone Number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verification code must be 4 digits`
  String get verificationCodeError {
    return Intl.message(
      'Verification code must be 4 digits',
      name: 'verificationCodeError',
      desc: '',
      args: [],
    );
  }

  /// `Name must not contain numbers`
  String get nameMustNotContainNumbers {
    return Intl.message(
      'Name must not contain numbers',
      name: 'nameMustNotContainNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Name must not contain special characters`
  String get nameMustNotContainSpecialCharacters {
    return Intl.message(
      'Name must not contain special characters',
      name: 'nameMustNotContainSpecialCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date`
  String get dateError {
    return Intl.message(
      'Invalid date',
      name: 'dateError',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be 11 digits`
  String get phoneNumberMustBe11Digits {
    return Intl.message(
      'Phone number must be 11 digits',
      name: 'phoneNumberMustBe11Digits',
      desc: '',
      args: [],
    );
  }

  /// `Positive for Brain Tumor`
  String get firstDiagnosisContainer {
    return Intl.message(
      'Positive for Brain Tumor',
      name: 'firstDiagnosisContainer',
      desc: '',
      args: [],
    );
  }

  /// `The MRI scan analysis reveals an abnormal mass in the left frontal lobe, measuring approximately 3.2 cm x 2.8 cm. The segmented region exhibits irregular borders and heterogeneous intensity, indicating possible malignancy. The tumor appears hyperintense on T2-weighted imaging and hypointense on T1-weighted imaging, which is characteristic of glioblastoma multiforme (GBM). Additionally, peritumoral edema and midline shift (3mm) suggest increased intracranial pressure.`
  String get secondDiagnosisContainer {
    return Intl.message(
      'The MRI scan analysis reveals an abnormal mass in the left frontal lobe, measuring approximately 3.2 cm x 2.8 cm. The segmented region exhibits irregular borders and heterogeneous intensity, indicating possible malignancy. The tumor appears hyperintense on T2-weighted imaging and hypointense on T1-weighted imaging, which is characteristic of glioblastoma multiforme (GBM). Additionally, peritumoral edema and midline shift (3mm) suggest increased intracranial pressure.',
      name: 'secondDiagnosisContainer',
      desc: '',
      args: [],
    );
  }

  /// `Reasoning Irregular shape and non-uniform intensity → Suggests malignancy rather than a benign tumor.Hyperintensity on T2-weighted images → Indicates fluid content, common in aggressive tumors.Presence of peritumoral edema → Often associated with high-grade gliomas.Midline shift → Suggests significant mass effect, warranting urgent medical intervention.`
  String get thirdDiagnosisContainer {
    return Intl.message(
      'Reasoning Irregular shape and non-uniform intensity → Suggests malignancy rather than a benign tumor.Hyperintensity on T2-weighted images → Indicates fluid content, common in aggressive tumors.Presence of peritumoral edema → Often associated with high-grade gliomas.Midline shift → Suggests significant mass effect, warranting urgent medical intervention.',
      name: 'thirdDiagnosisContainer',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get likes {
    return Intl.message(
      'Likes',
      name: 'likes',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Select Clinic`
  String get selectClinic {
    return Intl.message(
      'Select Clinic',
      name: 'selectClinic',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `There are no reviews available at the moment. Patients like you can help by leaving honest feedback`
  String get noReviews {
    return Intl.message(
      'There are no reviews available at the moment',
      name: 'noReviews',
      desc: '',
      args: [],
    );
  }

  /// `address: `
  String get address {
    return Intl.message(
      'address: ',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Choose day`
  String get chooseDay {
    return Intl.message(
      'Choose day',
      name: 'chooseDay',
      desc: '',
      args: [],
    );
  }

  /// `No slots available`
  String get noSlotsAvailable {
    return Intl.message(
      'No slots available',
      name: 'noSlotsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `You dont have chats yet`
  String get youDontHaveChatsYet {
    return Intl.message(
      'You dont have chats yet',
      name: 'youDontHaveChatsYet',
      desc: '',
      args: [],
    );
  }

  /// `Select Time Slot`
  String get selectTimeSlot {
    return Intl.message(
      'Select Time Slot',
      name: 'selectTimeSlot',
      desc: '',
      args: [],
    );
  }

  /// `Please select time slot`
  String get pleaseSelectTimeSlot {
    return Intl.message(
      'Please select time slot',
      name: 'pleaseSelectTimeSlot',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Booking`
  String get confirmBooking {
    return Intl.message(
      'Confirm Booking',
      name: 'confirmBooking',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Book Now`
  String get yesBookNow {
    return Intl.message(
      'Yes, Book Now',
      name: 'yesBookNow',
      desc: '',
      args: [],
    );
  }

  /// `Clinic`
  String get clinic {
    return Intl.message(
      'Clinic',
      name: 'clinic',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Confirmed`
  String get appointmentConfirmed {
    return Intl.message(
      'Appointment Confirmed',
      name: 'appointmentConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Your booking was successful. See you soon!`
  String get yourBookingWasSuccessfulSeeYouSoon {
    return Intl.message(
      'Your booking was successful. See you soon!',
      name: 'yourBookingWasSuccessfulSeeYouSoon',
      desc: '',
      args: [],
    );
  }

  /// `Failed to pick image`
  String get failedToPickImage {
    return Intl.message(
      'Failed to pick image',
      name: 'failedToPickImage',
      desc: '',
      args: [],
    );
  }

  /// `Please pick a file to upload`
  String get pleasePickAFileToUpload {
    return Intl.message(
      'Please pick a file to upload',
      name: 'pleasePickAFileToUpload',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Let’s reset it so you can get back to focusing on what really matters: your health and well-being`
  String get letsResetIt {
    return Intl.message(
      'Let’s reset it so you can get back to focusing on what really matters: your health and well-being',
      name: 'letsResetIt',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `ReEnter OTP code`
  String get enterOtp {
    return Intl.message(
      'ReEnter OTP code',
      name: 'enterOtp',
      desc: '',
      args: [],
    );
  }

  /// `No notifications yet`
  String get noNotifications {
    return Intl.message(
      'No notifications yet',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
