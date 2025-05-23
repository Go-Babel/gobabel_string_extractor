import 'package:gobabel_string_extractor/src/entities/babel_label_entity.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';

abstract class IMapBabelLabelsUsecase {
  List<BabelLabelEntity> call({required List<LabelsEntityRootLabel> strings});
}
