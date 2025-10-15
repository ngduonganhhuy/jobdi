import 'package:flutter/cupertino.dart' show CupertinoPicker;
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/domain/entities/country_entity.dart';
import 'package:jobdi/widgets/app_text.dart';

/// {@template selected_country_phone_picker}
/// SelectedCountryPhonePicker widget.
/// {@endtemplate}
class SelectedCountryPhonePicker extends StatefulWidget {
  /// {@macro selected_country_phone_picker}
  const SelectedCountryPhonePicker({
    required this.initialCountry,
    required this.onChange,
    super.key,
  });

  final CountryEntity initialCountry;
  final void Function(CountryEntity value) onChange;

  @override
  State<SelectedCountryPhonePicker> createState() =>
      _SelectedCountryPhonePickerState();
}

class _SelectedCountryPhonePickerState
    extends State<SelectedCountryPhonePicker> {
  late CountryEntity _selectedCountry;

  int get _indexCurrentItem =>
      CountryEntity.listCountries.indexOf(_selectedCountry);

  @override
  void initState() {
    _selectedCountry = widget.initialCountry;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: appScheme.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(22),
        topRight: Radius.circular(22),
      ),
    ),
    height: 250,
    child: CupertinoPicker(
      backgroundColor: Colors.transparent,
      itemExtent: 40,
      scrollController: FixedExtentScrollController(
        initialItem: _indexCurrentItem,
      ),
      onSelectedItemChanged: (index) {
        final item = CountryEntity.listCountries[index];
        setState(() {
          _selectedCountry = item;
        });
      },
      children: CountryEntity.listCountries
          .map(
            (country) => Center(
              child: RegularText(
                '${country.name} (${country.code})',
                fontSize: 14,
              ),
            ),
          )
          .toList(),
    ),
  );
}
