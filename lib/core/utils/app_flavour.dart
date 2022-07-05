enum Flavour { prod, dev, stag }

class AppFlavour {
  static final AppFlavour _appFlaour = AppFlavour._internal();

  AppFlavour._internal();

  factory AppFlavour() {
    return _appFlaour;
  }

  Flavour _flavour = Flavour.prod;

  initFlaour(Flavour flavour,
      {bool enableOldDebug = true, bool enableNewLog = true}) {
    this.enableNewLog = enableNewLog;
    this.enableOldDebug = enableOldDebug;
    _flavour = flavour;
    if (flavour == Flavour.dev) {
      _developmentInit();
    }
    if (flavour == Flavour.prod) {
      _productionInit();
    }
    if (flavour == Flavour.stag) {
      _stagingInit();
    }
  }

  bool enableOldDebug = false;
  bool enableNewLog = false;

  Flavour get runningFlavour => _flavour;

  String _baseUrl = "";
  String get baseUrl => _baseUrl;

  _productionInit() {
    _baseUrl = "https://production-rest-microservice.thesportstak.com/";
  }

  _developmentInit() {
    _baseUrl = "https://develop-rest-microservice.thesportstak.mobiletak.com/";
  }

  _stagingInit() {
    _baseUrl = "https://staging-rest-microservice.thesportstak.mobiletak.com/";
  }
}
