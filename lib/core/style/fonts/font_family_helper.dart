class FontFamilyHelper {
  const FontFamilyHelper._();
  static const String cairoArabic = "Cairo";
  static const String poppinsEnglish = "Poppins";
  //TODO : Switch Arabic font and English Font
  static String getLocalFontFamily() {
    final currentLanguage = 'ar';
    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
