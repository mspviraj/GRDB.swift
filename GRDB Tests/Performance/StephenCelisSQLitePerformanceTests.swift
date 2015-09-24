import XCTest
import SQLite

class StephenCelisSQLitePerformanceTests: XCTestCase {

    func testValueNamedPerformance() {
        let databasePath = NSBundle(forClass: self.dynamicType).pathForResource("FetchPerformanceTests", ofType: "sqlite")!
        let db = try! Connection(databasePath)
        
        let items = Table("items")
        let i0 = Expression<Int64>("i0")
        let i1 = Expression<Int64>("i1")
        let i2 = Expression<Int64>("i2")
        let i3 = Expression<Int64>("i3")
        let i4 = Expression<Int64>("i4")
        let i5 = Expression<Int64>("i5")
        let i6 = Expression<Int64>("i6")
        let i7 = Expression<Int64>("i7")
        let i8 = Expression<Int64>("i8")
        let i9 = Expression<Int64>("i9")

        self.measureBlock {
            for item in db.prepare(items) {
                let _ = item[i0]
                let _ = item[i1]
                let _ = item[i2]
                let _ = item[i3]
                let _ = item[i4]
                let _ = item[i5]
                let _ = item[i6]
                let _ = item[i7]
                let _ = item[i8]
                let _ = item[i9]
            }
        }
    }
    
    func testValueAtIndexPerformance() {
        let databasePath = NSBundle(forClass: self.dynamicType).pathForResource("FetchPerformanceTests", ofType: "sqlite")!
        let db = try! Connection(databasePath)
        
        self.measureBlock {
            for row in db.prepare("SELECT * FROM items") {
                let _ = row[0] as! Int64
                let _ = row[1] as! Int64
                let _ = row[2] as! Int64
                let _ = row[3] as! Int64
                let _ = row[4] as! Int64
                let _ = row[5] as! Int64
                let _ = row[6] as! Int64
                let _ = row[7] as! Int64
                let _ = row[8] as! Int64
                let _ = row[9] as! Int64
            }
        }
    }
}