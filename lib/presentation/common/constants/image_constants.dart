class AllImages {
  AllImages._();
  static final AllImages _instance = AllImages._();
  factory AllImages() => _instance;
  String image = 'assets/images';
  String defaultImage = 'https://via.placeholder.com/250';
}
