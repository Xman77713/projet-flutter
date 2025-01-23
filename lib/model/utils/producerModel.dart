class ListProducersModel {
  final List<ProducerModel> listProducersModel;

  ListProducersModel(this.listProducersModel);
}

class ProducerModel {
  final String? name;
  final int? id;

  ProducerModel(this.name, this.id);
}
