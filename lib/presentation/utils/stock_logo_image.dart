class StockLogoImage {
  static final logoList = {
    'BBAS3.SA': 'assets/images/company-logos/BBAS3.png',
    'ITSA4.SA': 'assets/images/company-logos/ITSA4.png',
    'ITUB4.SA': 'assets/images/company-logos/ITUB4.png',
    'LREN3.SA': 'assets/images/company-logos/LREN3.png',
    'PETR4.SA': 'assets/images/company-logos/PETR4.png',
    'VALE3.SA': 'assets/images/company-logos/VALE3.png',
  };

  static bool hasCompanyLogo(String ticker) {
    return logoList[ticker] != null;
  }
}