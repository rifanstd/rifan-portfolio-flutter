import 'package:portfolio/app/data/models/contact_model.dart';
import 'package:portfolio/app/data/repositories/base_repository.dart';

class ContactRepository extends BaseRepository<ContactModel> {
  ContactRepository()
      : super(
            collectionPath: "mail",
            fromJson: (json) => ContactModel.fromJson(json));
}
