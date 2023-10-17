class CepsModel {
  List<Results> _results = [];

  CepsModel();

  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;

  CepsModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String _objectId = "";
  String _createdAt = "";
  String _updatedAt = "";
  String _cep = "";
  String _logradouro = "";
  String _complemento = "";
  String _bairro = "";
  String _localidade = "";
  String _uf = "";
  String _ibge = "";
  String _gia = "";
  String _ddd = "";
  String _siafi = "";

  Results();

  String get objectId => _objectId;
  set objectId(String objectId) => _objectId = objectId;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get cep => _cep;
  set cep(String cep) => _cep = cep;
  String get logradouro => _logradouro;
  set logradouro(String logradouro) => _logradouro = logradouro;
  String get complemento => _complemento;
  set complemento(String complemento) => _complemento = complemento;
  String get bairro => _bairro;
  set bairro(String bairro) => _bairro = bairro;
  String get localidade => _localidade;
  set localidade(String localidade) => _localidade = localidade;
  String get uf => _uf;
  set uf(String uf) => _uf = uf;
  String get ibge => _ibge;
  set ibge(String ibge) => _ibge = ibge;
  String get gia => _gia;
  set gia(String gia) => _gia = gia;
  String get ddd => _ddd;
  set ddd(String ddd) => _ddd = ddd;
  String get siafi => _siafi;
  set siafi(String siafi) => _siafi = siafi;

  Results.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
    _uf = json['uf'];
    _ibge = json['ibge'];
    _gia = json['gia'];
    _ddd = json['ddd'];
    _siafi = json['siafi'];
  }

  Results.fromJsonViaCep(Map<String, dynamic> json) {
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
    _uf = json['uf'];
    _ibge = json['ibge'];
    _gia = json['gia'];
    _ddd = json['ddd'];
    _siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this._cep == "" ? "Sem dados" : this._cep;
    data['logradouro'] =
        this._logradouro == "" ? "Sem dados" : this._logradouro;
    data['complemento'] =
        this._complemento == "" ? "Sem dados" : this._complemento;
    data['bairro'] = this._bairro == "" ? "Sem dados" : this._bairro;
    data['localidade'] =
        this._localidade == "" ? "Sem dados" : this._localidade;
    data['uf'] = this._uf == "" ? "Sem dados" : this._uf;
    data['ibge'] = this._ibge == "" ? "Sem dados" : this._ibge;
    data['gia'] = this._gia == ""
        ? "Sem dados"
        : this.gia == ""
            ? "Sem dados"
            : this._gia;
    data['ddd'] = this._ddd == "" ? "Sem dados" : this._ddd;
    data['siafi'] = this._siafi == "" ? "Sem dados" : this._siafi;
    return data;
  }
}
