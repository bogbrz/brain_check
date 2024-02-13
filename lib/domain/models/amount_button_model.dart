import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount_button_model.freezed.dart';

@freezed
class AmountModel with _$AmountModel {
 
  factory AmountModel({
    required String name, required int nameId, required ,
  }) = _AmountModel;

}