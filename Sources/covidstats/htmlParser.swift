import Foundation
import SwiftSoup

func htmlParser(htmlString: String) -> [Entity] {
  var statsMap: [Entity] = []
  do {
    let doc: Document = try SwiftSoup.parse(htmlString)
    guard let table = try? doc.getElementById("main_table_countries_today") else {
      fatalError("Couldn't parse main table")
    }
    guard let rows = try? table.select("tbody").get(0).select("tr") as Elements else {
      fatalError("Couldn't parse table rows")
    }
    for row in rows where try !row.attr("style").contains("display: none") {
      let tds = try row.select("td")
      let raw = try tds.map { try $0.text() }
      let ent = Entity(raw: raw)
      statsMap.append(ent)
    }
    return statsMap
  } catch Exception.Error(_, let message) {
    print(message)
    exit(1)
  } catch {
    print("\(error)")
    exit(1)
  }
}
