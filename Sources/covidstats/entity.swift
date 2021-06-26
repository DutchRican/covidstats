struct Entity {
  var name: String
  var totalCases: Int
  var newCases: Int
  var totalDeaths: Int
  var newDeaths: Int
  var totalRecovered: Int
  var newRecovered: Int
  var activeCases: Int
  var seriousCritical: Int
  var casesPerMil: Int
  var deathsPerMil: Int
  var totalTests: Double
  var testsPerMil: Int
  var population: Int
  var continent: String

  init(raw: [String]) {
    self.name = raw[1]
    self.totalCases = raw[2].toInt()
    self.newCases = raw[3].toInt()
    self.totalDeaths = raw[4].toInt()
    self.newDeaths = raw[5].toInt()
    self.totalRecovered = raw[6].toInt()
    self.newRecovered = raw[7].toInt()
    self.activeCases = raw[8].toInt()
    self.seriousCritical = raw[9].toInt()
    self.casesPerMil = raw[10].toInt()
    self.deathsPerMil = raw[11].toInt()
    self.totalTests = raw[12].toDouble()
    self.testsPerMil = raw[13].toInt()
    self.population = raw[14].toInt()
    self.continent = raw[15]
  }

  func toArray() -> [String] {
    [
      self.name, 
      self.totalCases.withCommas(), 
      self.newCases.withCommas(),
      self.totalDeaths.withCommas(),
      self.newDeaths.withCommas(), 
      self.totalRecovered.withCommas(), 
      self.newRecovered.withCommas(),
      self.activeCases.withCommas(),
      self.seriousCritical.withCommas(), 
      self.casesPerMil.withCommas(),
      self.deathsPerMil.withCommas(), 
      self.totalTests.withCommas(),
      self.testsPerMil.withCommas(), 
      self.population.withCommas(), 
      self.continent,
    ]
  }
}
