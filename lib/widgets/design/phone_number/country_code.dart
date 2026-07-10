class CountryCode {
  final String name;
  final String dialCode; // e.g. '+966'
  final String isoCode; // e.g. 'SA'
  final String flagAsset; // optional; falls back to emoji when empty

  const CountryCode({
    required this.name,
    required this.dialCode,
    required this.isoCode,
    this.flagAsset = '',
  });
}

/// Swap for your own source / full list. Emoji flags render out of the box;
/// set [flagAsset] to use image/svg flags instead.
const List<CountryCode> kCountryCodes = [
  CountryCode(name: 'Saudi Arabia', dialCode: '+966', isoCode: 'SA'),
  CountryCode(name: 'Japan', dialCode: '+81', isoCode: 'JP'),
  CountryCode(name: 'France', dialCode: '+33', isoCode: 'FR'),
  CountryCode(name: 'South Africa', dialCode: '+27', isoCode: 'ZA'),
  CountryCode(name: 'Australia', dialCode: '+61', isoCode: 'AU'),
  CountryCode(name: 'Pakistan', dialCode: '+92', isoCode: 'PK'),
  CountryCode(name: 'United Kingdom', dialCode: '+44', isoCode: 'GB'),
  CountryCode(name: 'United States', dialCode: '+1', isoCode: 'US'),
  CountryCode(name: 'United Arab Emirates', dialCode: '+971', isoCode: 'AE'),
  CountryCode(name: 'India', dialCode: '+91', isoCode: 'IN'),
];
