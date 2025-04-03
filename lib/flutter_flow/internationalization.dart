import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sw'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? swText = '',
  }) =>
      [enText, swText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'ciaf9qxy': {
      'en': ' Empowering Your Legal Journey',
      'sw': '',
    },
    'tcjkn5rs': {
      'en': 'Your Strategic Legal Partners in Dar es Salaam.',
      'sw': '',
    },
    'qhp9jwbs': {
      'en': 'Book an Appointment',
      'sw': '',
    },
    'xh9vp3t8': {
      'en': 'Legal Consultation',
      'sw': '',
    },
    'nzt9xb85': {
      'en': 'Contracts & Business Law',
      'sw': '',
    },
    'ztyejzbg': {
      'en': 'Real Estate & Property Law',
      'sw': '',
    },
    'b9c7sket': {
      'en': 'Litigation & Court Representation',
      'sw': '',
    },
    '2kqvyfua': {
      'en': 'HOME',
      'sw': '',
    },
    'igui7itq': {
      'en': 'ABOUT US',
      'sw': '',
    },
    '2xc1c31h': {
      'en': 'PRACTICE AREAS',
      'sw': '',
    },
    '4r56xsj5': {
      'en': 'CONTACT US',
      'sw': '',
    },
    'jl7udoky': {
      'en': ' Empowering Your Legal Journey',
      'sw': '',
    },
    'js1rc64i': {
      'en': 'Your Strategic Legal Partners in Dar es Salaam.',
      'sw': '',
    },
    '79513asm': {
      'en': 'Book an Appointment',
      'sw': '',
    },
    'r03gtbzc': {
      'en': 'Legal Consultation',
      'sw': '',
    },
    'p612x89w': {
      'en': 'Real Estate & Property Law',
      'sw': '',
    },
    'l9zcpidy': {
      'en': 'Legal Consultation',
      'sw': '',
    },
    'm4frzz85': {
      'en': 'Contracts & Business Law',
      'sw': '',
    },
    'mlbia5yw': {
      'en': 'Real Estate & Property Law',
      'sw': '',
    },
    'vrbe5fm5': {
      'en': 'Litigation & Court Representation',
      'sw': '',
    },
    'ddht36xa': {
      'en': ' WHAT WE DO ',
      'sw': '',
    },
    '14dnv752': {
      'en': 'Practice Areas',
      'sw': '',
    },
    'gli0nz79': {
      'en': 'See All Practice \nAreas',
      'sw': '',
    },
    '1but9xwf': {
      'en': 'Why Choose Madafa Advocates?',
      'sw': '',
    },
    'r1s9c361': {
      'en':
          'At Madafa Advocates, we are committed to providing top-tier \nlegal services with professionalism, integrity, and excellence. \nOur experienced team offers tailored legal solutions, strong \nlitigation and negotiation skills, and a client-centered approach. \nWith a proven track record, confidentiality, and transparent \npricing, we ensure that every client receives the best legal \nrepresentation and guidance.',
      'sw': '',
    },
    'ymh3pmos': {
      'en': 'Why Choose Madafa Advocates?',
      'sw': '',
    },
    'zm6xl2ir': {
      'en':
          'At Madafa Advocates, we are committed to providing top-tier \nlegal services with professionalism, integrity, and excellence. \nOur experienced team offers tailored legal solutions, strong \nlitigation and negotiation skills, and a client-centered approach. \nWith a proven track record, confidentiality, and transparent \npricing, we ensure that every client receives the best legal \nrepresentation and guidance.',
      'sw': '',
    },
    'biy6mgi0': {
      'en': 'Our Testimonials',
      'sw': '',
    },
    'jv6yvhtn': {
      'en': 'What clients are saying about us',
      'sw': '',
    },
    'm8qgh7vn': {
      'en': 'Our Testimonials',
      'sw': '',
    },
    'urrdilo0': {
      'en': 'What clients are \nsaying about us',
      'sw': '',
    },
    '65gve7j8': {
      'en': 'To discuss your requirements, or \nto ask a lawyer a question',
      'sw': '',
    },
    'nr6bqju0': {
      'en': 'Contact us',
      'sw': '',
    },
    'j7tdwle3': {
      'en': 'To discuss your requirements,\n or to ask a lawyer a question',
      'sw': '',
    },
    '5yhw85vp': {
      'en': 'Contact us',
      'sw': '',
    },
    'iyw0hmzj': {
      'en': 'HOME',
      'sw': '',
    },
    '9s7jako6': {
      'en': 'ABOUT US',
      'sw': '',
    },
    'htf5ps9e': {
      'en': 'PRACTIES ARES',
      'sw': '',
    },
    '5uy98m61': {
      'en': 'CONTACT US',
      'sw': '',
    },
    '1ac213fb': {
      'en': 'Home',
      'sw': '',
    },
  },
  // practiseArea
  {
    'sjjmryhr': {
      'en': 'HOME',
      'sw': '',
    },
    'dq7qtmfu': {
      'en': 'ABOUT US',
      'sw': '',
    },
    'oaiwg7uk': {
      'en': 'PRACTICE AREAS',
      'sw': '',
    },
    'p2atqt0t': {
      'en': 'CONTACT US',
      'sw': '',
    },
    'juufte94': {
      'en': 'Practice Areas',
      'sw': '',
    },
    'pj6cmkth': {
      'en': 'Practice Areas',
      'sw': '',
    },
    '2wts5u16': {
      'en': 'To discuss your requirements, or \nto ask a lawyer a question',
      'sw': '',
    },
    'jp8e8yft': {
      'en': 'Contact us',
      'sw': '',
    },
    'r5xrginn': {
      'en': 'To discuss your requirements,\n or to ask a lawyer a question',
      'sw': '',
    },
    'zbkj337s': {
      'en': 'Contact us',
      'sw': '',
    },
    'y04k5zzo': {
      'en': 'HOME',
      'sw': '',
    },
    'tp1s38hr': {
      'en': 'ABOUT US',
      'sw': '',
    },
    '3g43klxv': {
      'en': 'PRACTIES ARES',
      'sw': '',
    },
    'x1a3tezj': {
      'en': 'CONTACT US',
      'sw': '',
    },
  },
  // aboutUs
  {
    'nww1uq9n': {
      'en': 'HOME',
      'sw': '',
    },
    'h07risxt': {
      'en': 'ABOUT US',
      'sw': '',
    },
    '6xopz5ce': {
      'en': 'PRACTICE AREAS',
      'sw': '',
    },
    'ymvgchdc': {
      'en': 'CONTACT US',
      'sw': '',
    },
    '9yfaql7n': {
      'en': 'Justice. Integrity. Excellence.',
      'sw': '',
    },
    'y6j5nls4': {
      'en': 'Dedicated legal advocates fighting for your rights',
      'sw': '',
    },
    '1yivtohk': {
      'en': 'Schedule Consultation',
      'sw': '',
    },
    'jtw8clns': {
      'en': 'About Us',
      'sw': '',
    },
    'zet8b8co': {
      'en':
          'Madafa Advocates, located in the heart of Dar es Salaam on Mwinjuma Road, Vijana House 1st Floor, is a well-established legal firm with a decade of dedicated service to clients across Tanzania. Our team of experienced advocates possesses a comprehensive understanding of diverse legal areas, specializing in corporate law, criminal defense, probate, mining, agricultural investment, and maritime law.\n\nAt Madafa Advocates, we are committed to providing our clients with exceptional legal representation, driven by our core principle: \"Personal Injury is Our Priority.\" We understand that legal matters can be complex and emotionally challenging, and we strive to offer compassionate and effective advocacy to achieve the best possible outcomes for our clients.\n\nOur firm\'s extensive experience, coupled with our in-depth knowledge of Tanzanian law, allows us to navigate intricate legal landscapes with confidence and precision. We are dedicated to building strong client relationships based on trust, integrity, and a commitment to excellence.\n\nWhether you require expert counsel in corporate transactions, robust defense in criminal proceedings, guidance in probate matters, or strategic advice in mining, agricultural investment, or maritime law, Madafa Advocates is here to serve you. We are passionate about protecting your rights and interests, ensuring that you receive the legal support you deserve.\n\nWe are Madafa Advocates, and we are your partners in justice.',
      'sw': '',
    },
    '94d5g2si': {
      'en': 'About Us',
      'sw': '',
    },
    'ldyaitt6': {
      'en':
          'Madafa Advocates, located in the heart of Dar es Salaam on Mwinjuma Road, Vijana House 1st Floor, is a well-established legal firm with a decade of dedicated service to clients across Tanzania. Our team of experienced advocates possesses a comprehensive understanding of diverse legal areas, specializing in corporate law, criminal defense, probate, mining, agricultural investment, and maritime law.\n\nAt Madafa Advocates, we are committed to providing our clients with exceptional legal representation, driven by our core principle: \"Personal Injury is Our Priority.\" We understand that legal matters can be complex and emotionally challenging, and we strive to offer compassionate and effective advocacy to achieve the best possible outcomes for our clients.\n\nOur firm\'s extensive experience, coupled with our in-depth knowledge of Tanzanian law, allows us to navigate intricate legal landscapes with confidence and precision. We are dedicated to building strong client relationships based on trust, integrity, and a commitment to excellence.\n\nWhether you require expert counsel in corporate transactions, robust defense in criminal proceedings, guidance in probate matters, or strategic advice in mining, agricultural investment, or maritime law, Madafa Advocates is here to serve you. We are passionate about protecting your rights and interests, ensuring that you receive the legal support you deserve.\n\nWe are Madafa Advocates, and we are your partners in justice.',
      'sw': '',
    },
    'cllcz0sj': {
      'en': 'HOME',
      'sw': '',
    },
    'agi7xu60': {
      'en': 'ABOUT US',
      'sw': '',
    },
    'dylc716i': {
      'en': 'PRACTIES ARES',
      'sw': '',
    },
    'sxf907ci': {
      'en': 'CONTACT US',
      'sw': '',
    },
  },
  // ContactUs
  {
    'fe4y2kc2': {
      'en': 'HOME',
      'sw': '',
    },
    'n03rkjoj': {
      'en': 'ABOUT US',
      'sw': '',
    },
    'vspatsfw': {
      'en': 'PRACTICE AREAS',
      'sw': '',
    },
    'yrjj736u': {
      'en': 'CONTACT US',
      'sw': '',
    },
    'axtb5kas': {
      'en': 'Get in Touch',
      'sw': '',
    },
    'onou6gp4': {
      'en':
          'Our team of experienced attorneys is ready to assist you with your legal needs. Reach out to us today.',
      'sw': '',
    },
    'tp4gpujf': {
      'en': 'Send us a Message',
      'sw': '',
    },
    'ia154kfz': {
      'en': 'Full Name',
      'sw': '',
    },
    'eqhz1ccn': {
      'en': 'Email Address',
      'sw': '',
    },
    'tawfa8m0': {
      'en': 'Phone Number',
      'sw': '',
    },
    'u2e7v9f4': {
      'en': 'Subject',
      'sw': '',
    },
    'dqtfjo1i': {
      'en': 'Your Message',
      'sw': '',
    },
    'iz91y4fg': {
      'en': 'Submit',
      'sw': '',
    },
    'kqfmj2h3': {
      'en': 'Send us a Message',
      'sw': '',
    },
    'n7ubsshg': {
      'en': 'Full Name',
      'sw': '',
    },
    'f7r31l9f': {
      'en': 'Email Address',
      'sw': '',
    },
    'mmmdpznw': {
      'en': 'Phone Number',
      'sw': '',
    },
    '3stnyjum': {
      'en': 'Subject',
      'sw': '',
    },
    'c3yi2o3i': {
      'en': 'Your Message',
      'sw': '',
    },
    '0uf28jn2': {
      'en': 'Submit',
      'sw': '',
    },
    'mx3317xn': {
      'en': 'HOME',
      'sw': '',
    },
    'nfik3dqs': {
      'en': 'ABOUT US',
      'sw': '',
    },
    '99g5fks5': {
      'en': 'PRACTIES ARES',
      'sw': '',
    },
    'vh1c1udk': {
      'en': 'CONTACT US',
      'sw': '',
    },
  },
  // AuthenticationPage
  {
    '2gr8p35g': {
      'en': 'Log In',
      'sw': '',
    },
    'fhmxdu3d': {
      'en': 'Welcome Back Admin',
      'sw': '',
    },
    '5abchmdr': {
      'en': 'Fill out the information below in order to access your account.',
      'sw': '',
    },
    '37t48ebx': {
      'en': 'Password',
      'sw': '',
    },
    'lm73fkgc': {
      'en': 'Sign In',
      'sw': '',
    },
    'yl9tttgm': {
      'en': 'Home',
      'sw': '',
    },
  },
  // adminDashboard
  {
    'owcs5270': {
      'en': 'Website Content Management',
      'sw': '',
    },
    'jk2wlhnv': {
      'en': 'Slide Images',
      'sw': '',
    },
    'cimoh0az': {
      'en': 'Add New',
      'sw': '',
    },
    'zd3hyni3': {
      'en': 'Testimonials',
      'sw': '',
    },
    'knyfwktq': {
      'en': 'Add New',
      'sw': '',
    },
    'xhn12309': {
      'en': 'Practice Areas',
      'sw': '',
    },
    'lgoqgdoy': {
      'en': 'Add New',
      'sw': '',
    },
    'c4nl5hmn': {
      'en': 'Customer Message',
      'sw': '',
    },
    'zb8fbo26': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
    'lkbtrx0e': {
      'en': 'Website Content Management',
      'sw': '',
    },
    'hgryjwll': {
      'en': 'Slide Images',
      'sw': '',
    },
    'tf8c1mk8': {
      'en': 'Add New',
      'sw': '',
    },
    's0pbfsqs': {
      'en': 'Testimonials',
      'sw': '',
    },
    'rvowjjmi': {
      'en': 'Add New',
      'sw': '',
    },
    'qhx6e6c2': {
      'en': 'Practice Areas',
      'sw': '',
    },
    'bqesb5bl': {
      'en': 'Add New',
      'sw': '',
    },
    'qzpffrvf': {
      'en': 'Customer Message',
      'sw': '',
    },
    'w5wowahs': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
  },
  // AddslideImage
  {
    'i1hzjp7k': {
      'en': 'Website Content Management',
      'sw': '',
    },
    '78htgrof': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    'ginhydyx': {
      'en': 'Recommended size: 1200 x 600',
      'sw': '',
    },
    '6r7386dm': {
      'en': 'Save Slide',
      'sw': '',
    },
    '3r0u4l4l': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
    '6h0yvpg8': {
      'en': 'Website Content Management',
      'sw': '',
    },
    '7i19tq9y': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    'bwabhp4x': {
      'en': 'Recommended size: 1200 x 600',
      'sw': '',
    },
    't5cq3ew9': {
      'en': 'Save Slide',
      'sw': '',
    },
    'dc0onsha': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
  },
  // addTestmone
  {
    'ajbkvqsn': {
      'en': 'Website Content Management',
      'sw': '',
    },
    'nu2c07r7': {
      'en':
          'Share your experience with us! Your testimonial will help others learn about our services.',
      'sw': '',
    },
    '56pvbaqp': {
      'en': 'Customer  Name',
      'sw': '',
    },
    'xfjucgpg': {
      'en': 'Enter your full name',
      'sw': '',
    },
    '3h3al3g3': {
      'en': 'Customer Title',
      'sw': '',
    },
    'p8duspdd': {
      'en': 'Enter title',
      'sw': '',
    },
    '00pqnsxr': {
      'en': 'Title/ Head',
      'sw': '',
    },
    'h8bsytp7': {
      'en': 'Title of a testmone',
      'sw': '',
    },
    '9vztlbao': {
      'en': 'Description',
      'sw': '',
    },
    '67pdohx9': {
      'en': 'Tell us about your customer experience',
      'sw': '',
    },
    'jdybqew3': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    '7zm2zqno': {
      'en': 'Recommended size: 1200 x 600',
      'sw': '',
    },
    't1752sxc': {
      'en': 'Display my testimonial publicly',
      'sw': '',
    },
    '0gywo1zs': {
      'en': 'Your testimonial may appear on our website or marketing materials',
      'sw': '',
    },
    '0pe1i27z': {
      'en': 'Submit Testimonial',
      'sw': '',
    },
    'ed2ohjwz': {
      'en': 'Enter your full name is required',
      'sw': '',
    },
    '8fkl8yg9': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '9cc68p5v': {
      'en': 'Enter title is required',
      'sw': '',
    },
    'a4d8k5v6': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '0rmrabpd': {
      'en': 'Title of a testmone is required',
      'sw': '',
    },
    'sl3iplbo': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '4g3nuduq': {
      'en': 'Tell us about your customer experience is required',
      'sw': '',
    },
    '8fznuxg3': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'epfpaq14': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
    '97jcxnro': {
      'en': 'Website Content Management',
      'sw': '',
    },
    '2k0kcafa': {
      'en':
          'Share your experience with us! Your testimonial will help others learn about our services.',
      'sw': '',
    },
    'vvx4rztz': {
      'en': 'Customer  Name',
      'sw': '',
    },
    'nclmkr68': {
      'en': 'Enter your full name',
      'sw': '',
    },
    'uam6876m': {
      'en': 'Customer Title',
      'sw': '',
    },
    'qm8lry8b': {
      'en': 'Enter title',
      'sw': '',
    },
    'ntx5f294': {
      'en': 'Title/ Head',
      'sw': '',
    },
    '9sfy00ll': {
      'en': 'Title of a testmone',
      'sw': '',
    },
    'qwgz901d': {
      'en': 'Description',
      'sw': '',
    },
    'zoug517c': {
      'en': 'Tell us about your customer experience',
      'sw': '',
    },
    '6jhp9lyv': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    'jc346f0k': {
      'en': 'Recommended size: 1200 x 600',
      'sw': '',
    },
    'turydmrf': {
      'en': 'Display my testimonial publicly',
      'sw': '',
    },
    'q2cjz6fk': {
      'en': 'Your testimonial may appear on our website or marketing materials',
      'sw': '',
    },
    '3jbqxox1': {
      'en': 'Submit Testimonial',
      'sw': '',
    },
    'n5parrn2': {
      'en': 'Enter your full name is required',
      'sw': '',
    },
    '14cqywhc': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'l0g3u7uj': {
      'en': 'Enter title is required',
      'sw': '',
    },
    'zccs4q5e': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '7vwtcwmk': {
      'en': 'Title of a testmone is required',
      'sw': '',
    },
    'angg1iam': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'ptf8uqlo': {
      'en': 'Tell us about your customer experience is required',
      'sw': '',
    },
    '5wpw48fq': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '3txq6nnz': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
  },
  // addPractiseAreas
  {
    'ap0paroi': {
      'en': 'Website Content Management',
      'sw': '',
    },
    '2ikpi4v5': {
      'en': 'Practice Area Image',
      'sw': '',
    },
    'vj4sfnqi': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    'l4w2kcs0': {
      'en': 'Practice Area Details',
      'sw': '',
    },
    'gkesrmxu': {
      'en': 'Practice Area Name',
      'sw': '',
    },
    'rvkin2w3': {
      'en': 'Enter practice area name',
      'sw': '',
    },
    'vhvh0zwn': {
      'en': 'Short Description',
      'sw': '',
    },
    'jqgu8cy5': {
      'en': 'Brief overview (max 150 characters)',
      'sw': '',
    },
    'm6nnlpi5': {
      'en': 'Detailed Description',
      'sw': '',
    },
    'mql7fwz8': {
      'en': 'Provide a comprehensive description of this practice area...',
      'sw': '',
    },
    '1qj6tcvy': {
      'en': 'Save Practice Area',
      'sw': '',
    },
    'jdwy9mla': {
      'en': 'Enter practice area name is required',
      'sw': '',
    },
    'g7kt6zch': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '4lf4a6tj': {
      'en': 'Brief overview (max 150 characters) is required',
      'sw': '',
    },
    'wadispj9': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'o5mbshu0': {
      'en':
          'Provide a comprehensive description of this practice area... is required',
      'sw': '',
    },
    'zjhdevlg': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'dch81dlw': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
    'ydbm774j': {
      'en': 'Website Content Management',
      'sw': '',
    },
    'kj0pe441': {
      'en': 'Practice Area Image',
      'sw': '',
    },
    'xeylm6in': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    'llpyolct': {
      'en': 'Practice Area Details',
      'sw': '',
    },
    'h88ry8ix': {
      'en': 'Practice Area Name',
      'sw': '',
    },
    'akppo9w4': {
      'en': 'Enter practice area name',
      'sw': '',
    },
    '80bkgiuw': {
      'en': 'Short Description',
      'sw': '',
    },
    '0vp2sljn': {
      'en': 'Brief overview (max 150 characters)',
      'sw': '',
    },
    '49ro5ymv': {
      'en': 'Detailed Description',
      'sw': '',
    },
    'j0de49zi': {
      'en': 'Provide a comprehensive description of this practice area...',
      'sw': '',
    },
    'i4a596gl': {
      'en': 'Save Practice Area',
      'sw': '',
    },
    'gj8tz9pi': {
      'en': 'Enter practice area name is required',
      'sw': '',
    },
    '9qf7eyv8': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '6lxog0vy': {
      'en': 'Brief overview (max 150 characters) is required',
      'sw': '',
    },
    'cibt85kc': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'rhe9x6e4': {
      'en':
          'Provide a comprehensive description of this practice area... is required',
      'sw': '',
    },
    'dj478xk1': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'fk5voqqo': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
  },
  // editPractiseAreas
  {
    'yprv06y7': {
      'en': 'Website Content Management',
      'sw': '',
    },
    'cy4qzgks': {
      'en': 'Practice Area Image',
      'sw': '',
    },
    'b7uoscht': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    '36upq6od': {
      'en': 'Practice Area Details',
      'sw': '',
    },
    'b5bwnmzd': {
      'en': 'Practice Area Name',
      'sw': '',
    },
    'r54kuo9w': {
      'en': 'Enter practice area name',
      'sw': '',
    },
    'spom9vie': {
      'en': 'Short Description',
      'sw': '',
    },
    '3s5qgx2q': {
      'en': 'Brief overview (max 150 characters)',
      'sw': '',
    },
    'zno0wg2u': {
      'en': 'Detailed Description',
      'sw': '',
    },
    '9awotxec': {
      'en': 'Provide a comprehensive description of this practice area...',
      'sw': '',
    },
    'pcyhf2ng': {
      'en': 'Save Practice Area',
      'sw': '',
    },
    'aajvwuu7': {
      'en': 'Enter practice area name is required',
      'sw': '',
    },
    'povwfyor': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '6mcncg4m': {
      'en': 'Brief overview (max 150 characters) is required',
      'sw': '',
    },
    'qyz4qida': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '5tgzirf5': {
      'en':
          'Provide a comprehensive description of this practice area... is required',
      'sw': '',
    },
    '8ljwet1s': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'l0mzsrz6': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
    'i7j722k3': {
      'en': 'Website Content Management',
      'sw': '',
    },
    'odoincv1': {
      'en': 'Practice Area Image',
      'sw': '',
    },
    'e29cvdzh': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    '5pwic3qn': {
      'en': 'Practice Area Details',
      'sw': '',
    },
    'b0p2c761': {
      'en': 'Practice Area Name',
      'sw': '',
    },
    'yt55bp0w': {
      'en': 'Enter practice area name',
      'sw': '',
    },
    'vsy6co4c': {
      'en': 'Short Description',
      'sw': '',
    },
    'zswfl6sn': {
      'en': 'Brief overview (max 150 characters)',
      'sw': '',
    },
    'dokl7744': {
      'en': 'Detailed Description',
      'sw': '',
    },
    'sn8zi3fs': {
      'en': 'Provide a comprehensive description of this practice area...',
      'sw': '',
    },
    'hh7un7no': {
      'en': 'Save Practice Area',
      'sw': '',
    },
    'ptcdbi1c': {
      'en': 'Enter practice area name is required',
      'sw': '',
    },
    'yf8x9gi5': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'pzlqfnit': {
      'en': 'Brief overview (max 150 characters) is required',
      'sw': '',
    },
    'i7743zhq': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'u3w11fkq': {
      'en':
          'Provide a comprehensive description of this practice area... is required',
      'sw': '',
    },
    'va8z1ux9': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'ch9yd3wq': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
  },
  // editTestmone
  {
    'acag1o24': {
      'en': 'Website Content Management',
      'sw': '',
    },
    'fdtywcqi': {
      'en':
          'Share your experience with us! Your testimonial will help others learn about our services.',
      'sw': '',
    },
    '7fl3win5': {
      'en': 'Customer  Name',
      'sw': '',
    },
    'npe77dti': {
      'en': 'Enter your full name',
      'sw': '',
    },
    '9m6i0gm5': {
      'en': 'Customer Title',
      'sw': '',
    },
    'v4quxqu9': {
      'en': 'Enter title',
      'sw': '',
    },
    'swog02ic': {
      'en': 'Title/ Head',
      'sw': '',
    },
    'r0n6d3qp': {
      'en': 'Title of a testmone',
      'sw': '',
    },
    'd8tzhvnp': {
      'en': 'Description',
      'sw': '',
    },
    '6bnowv5h': {
      'en': 'Tell us about your customer experience',
      'sw': '',
    },
    'fh7mh7w6': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    'm37xw750': {
      'en': 'Recommended size: 1200 x 600',
      'sw': '',
    },
    'kysug90h': {
      'en': 'Display my testimonial publicly',
      'sw': '',
    },
    'j16xnqp7': {
      'en': 'Your testimonial may appear on our website or marketing materials',
      'sw': '',
    },
    'inqk2r61': {
      'en': 'Submit Testimonial',
      'sw': '',
    },
    'z4r73790': {
      'en': 'Enter your full name is required',
      'sw': '',
    },
    'pmat1ts3': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'c8rny9tg': {
      'en': 'Enter title is required',
      'sw': '',
    },
    '23qgqgc9': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'd81pnbxo': {
      'en': 'Title of a testmone is required',
      'sw': '',
    },
    'r2t94089': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '0oy69wkz': {
      'en': 'Tell us about your customer experience is required',
      'sw': '',
    },
    'sktjc7qd': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '1sna9jw2': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
    'fk6zgbxq': {
      'en': 'Website Content Management',
      'sw': '',
    },
    'jkqf485b': {
      'en':
          'Share your experience with us! Your testimonial will help others learn about our services.',
      'sw': '',
    },
    '99qaq8sd': {
      'en': 'Customer  Name',
      'sw': '',
    },
    '1dhtoe2r': {
      'en': 'Enter your full name',
      'sw': '',
    },
    '0uiz38m4': {
      'en': 'Customer Title',
      'sw': '',
    },
    'tw9qat76': {
      'en': 'Enter title',
      'sw': '',
    },
    'r4tlwwfe': {
      'en': 'Title/ Head',
      'sw': '',
    },
    'g5z4c42e': {
      'en': 'Title of a testmone',
      'sw': '',
    },
    'f0w3qqnh': {
      'en': 'Description',
      'sw': '',
    },
    'l3n315wj': {
      'en': 'Tell us about your customer experience',
      'sw': '',
    },
    '0j6g549o': {
      'en': 'Tap to upload image',
      'sw': '',
    },
    'poco3qn8': {
      'en': 'Recommended size: 1200 x 600',
      'sw': '',
    },
    'zfbxfuip': {
      'en': 'Display my testimonial publicly',
      'sw': '',
    },
    'k24aopwx': {
      'en': 'Your testimonial may appear on our website or marketing materials',
      'sw': '',
    },
    'bhdzhmii': {
      'en': 'Submit Testimonial',
      'sw': '',
    },
    '34awk03a': {
      'en': 'Enter your full name is required',
      'sw': '',
    },
    'ad9rhfv2': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'll23fge2': {
      'en': 'Enter title is required',
      'sw': '',
    },
    '9xb3p7lm': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'wyf8exj1': {
      'en': 'Title of a testmone is required',
      'sw': '',
    },
    'e5vo0ze5': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    'i86wew6z': {
      'en': 'Tell us about your customer experience is required',
      'sw': '',
    },
    'pfia8ry6': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '6cqe02g6': {
      'en': '© 2024 Admin Dashboard. All rights reserved.',
      'sw': '',
    },
  },
  // headerUp
  {
    '0722azrc': {
      'en':
          'Vijana House of Vision Opposite Meridian Hotel Peram Street, Dar es Salaam',
      'sw': '',
    },
    'vy9d4l5l': {
      'en': '+255 699 344 344 | +255 689 047 738',
      'sw': '',
    },
  },
  // headerdown
  {
    'ejlfjsp9': {
      'en': 'HOME',
      'sw': '',
    },
    'fzdfkusn': {
      'en': 'ABOUT US',
      'sw': '',
    },
    'x6fpce28': {
      'en': 'PRACTICE AREAS',
      'sw': '',
    },
    '4rbzqqnn': {
      'en': 'CONTACT US',
      'sw': '',
    },
  },
  // footer
  {
    'jbim17sr': {
      'en':
          'Madafa Advocates is a leading law firm dedicated to providing top-tier \nlegal services to individuals and businesses. With a team of highly \nexperienced professionals, we are committed to delivering transparent, \nethical, and high-quality legal solutions. We believe in justice and ensure \nthat every client receives the right legal guidance tailored to their needs.',
      'sw': '',
    },
    '0wrt9z4l': {
      'en': 'Adress',
      'sw': '',
    },
    'f9adquym': {
      'en':
          'Vijana House of Vision, \nOpposite Meridian Hotel\nP.0. Box 10750\nDar es Salaam - Tanzania',
      'sw': '',
    },
    'pnxvul25': {
      'en': 'Contact Info',
      'sw': '',
    },
    'ldz7lzi8': {
      'en':
          'You can always contact \nwith us via email or phone. \nGet in touch with contact \nand get a quote form.\n (+255) 222 926 114\n info@madafaadvocates.co.tz',
      'sw': '',
    },
    'd27phb1u': {
      'en': '© Copyright 2025. EsoTech. All Rights Reserved',
      'sw': '',
    },
    '457bd471': {
      'en':
          'Madafa Advocates is a leading law firm dedicated to providing top-tier legal services to individuals and businesses. With a team of highly experienced professionals, we are committed to delivering transparent, ethical, and high-quality legal solutions. We believe in justice and ensure that every client receives the right legal guidance tailored to their needs.',
      'sw': '',
    },
    '4yt4rjrn': {
      'en': 'Adress',
      'sw': '',
    },
    '4gjhaldu': {
      'en':
          'Vijana House of Vision, \nOpposite Meridian Hotel\nP.0. Box 10750\nDar es Salaam - Tanzania',
      'sw': '',
    },
    'df8t2ycw': {
      'en': 'Contact Info',
      'sw': '',
    },
    'pqfjz7tq': {
      'en':
          'You can always contact \nwith us via email or phone. \nGet in touch with contact \nand get a quote form.\n (+255) 222 926 114\n info@madafaadvocates.co.tz',
      'sw': '',
    },
    '4fjya5zg': {
      'en': '© Copyright 2025. EsoTech. All Rights Reserved',
      'sw': '',
    },
  },
  // practiseAreas
  {
    '6z12cytf': {
      'en': 'Read More',
      'sw': '',
    },
  },
  // headerdown1
  {
    'b2v0j406': {
      'en': 'HOME',
      'sw': '',
    },
    'ah02xyee': {
      'en': 'ABOUT US',
      'sw': '',
    },
    'bw3egqwv': {
      'en': 'PRACTICE AREAS',
      'sw': '',
    },
    'cf5njbfz': {
      'en': 'CONTACT US',
      'sw': '',
    },
  },
  // readMorePractiseArea
  {
    'lvnii8a7': {
      'en': 'Contact Us For Help',
      'sw': '',
    },
  },
  // messageConfirmDelete
  {
    'gult107k': {
      'en': 'Confirm Delete',
      'sw': '',
    },
    '36h8kfrp': {
      'en':
          'Are you sure you want to delete this item? This action cannot be undone.',
      'sw': '',
    },
    'ujkj4ize': {
      'en': 'Cancel',
      'sw': '',
    },
    '9psy7i6s': {
      'en': 'Delete',
      'sw': '',
    },
  },
  // testmoneConfirmDelete
  {
    'o7cdogub': {
      'en': 'Confirm Delete',
      'sw': '',
    },
    'n30qnvrw': {
      'en':
          'Are you sure you want to delete this item? This action cannot be undone.',
      'sw': '',
    },
    'xyu5iesy': {
      'en': 'Cancel',
      'sw': '',
    },
    'docqyavg': {
      'en': 'Delete',
      'sw': '',
    },
  },
  // slideConfirmDelete
  {
    '95vun021': {
      'en': 'Confirm Delete',
      'sw': '',
    },
    'mf6ds8qn': {
      'en':
          'Are you sure you want to delete this item? This action cannot be undone.',
      'sw': '',
    },
    '7h0b3zf0': {
      'en': 'Cancel',
      'sw': '',
    },
    'txe7n7yd': {
      'en': 'Delete',
      'sw': '',
    },
  },
  // practiseConfirmDelete
  {
    'zqn6whi4': {
      'en': 'Confirm Delete',
      'sw': '',
    },
    'm2086ta1': {
      'en':
          'Are you sure you want to delete this item? This action cannot be undone.',
      'sw': '',
    },
    'xw252t7u': {
      'en': 'Cancel',
      'sw': '',
    },
    'kqm8nfsj': {
      'en': 'Delete',
      'sw': '',
    },
  },
  // Miscellaneous
  {
    'v2zpjekv': {
      'en': '',
      'sw': '',
    },
    'drokb4ag': {
      'en': '',
      'sw': '',
    },
    'devij3n9': {
      'en': '',
      'sw': '',
    },
    'yf7mzb4w': {
      'en': '',
      'sw': '',
    },
    'qyjpi7he': {
      'en': '',
      'sw': '',
    },
    'hmn196wq': {
      'en': '',
      'sw': '',
    },
    'o0sqjb6y': {
      'en': '',
      'sw': '',
    },
    '8i21gpti': {
      'en': '',
      'sw': '',
    },
    'p59v4um4': {
      'en': '',
      'sw': '',
    },
    'uhnjz347': {
      'en': '',
      'sw': '',
    },
    'uyj2hm2y': {
      'en': '',
      'sw': '',
    },
    '1t1oipda': {
      'en': '',
      'sw': '',
    },
    'cokne3sk': {
      'en': '',
      'sw': '',
    },
    '8zv3uie7': {
      'en': '',
      'sw': '',
    },
    '56qwukmh': {
      'en': '',
      'sw': '',
    },
    '0seuxg55': {
      'en': '',
      'sw': '',
    },
    '95fpthck': {
      'en': '',
      'sw': '',
    },
    'llelcaky': {
      'en': '',
      'sw': '',
    },
    's9vta14x': {
      'en': '',
      'sw': '',
    },
    'kxas5t1x': {
      'en': '',
      'sw': '',
    },
    'r36lloqg': {
      'en': '',
      'sw': '',
    },
    '53g7vaa4': {
      'en': '',
      'sw': '',
    },
    'lia4p46y': {
      'en': '',
      'sw': '',
    },
    'vbfwzyre': {
      'en': '',
      'sw': '',
    },
    'vc3gaj1d': {
      'en': '',
      'sw': '',
    },
    'q4wi41me': {
      'en': '',
      'sw': '',
    },
    'l3nagn4y': {
      'en': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
