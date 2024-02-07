
enum Flavor {
  development,
  production,
}


class Config {
  static Flavor appFlavor = Flavor.development;

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.development:
        return "Developers version";
      case Flavor.production:
        return "Users version";
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://opentdb.com/';
      case Flavor.production:
        return 'https://opentdb.com/';
    }
  }

  static bool get debugShowCheckModeBanner {
    switch (appFlavor) {
      case Flavor.development:
        return true;
      case Flavor.production:
        return false;
    }
  }


  
}
