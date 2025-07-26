//
//  USDA.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/26/25.
//
// This file was generated from JSON Schema using quicktype

import Foundation

// MARK: - CodableFoundationFood
struct CodableFoundationFood: Codable {
    let foodClass: String
    let description: String
    let foodNutrients: [CodableFoundationFoodFoodNutrient]
    let foodAttributes: [JSONAny]
    let nutrientConversionFactors: [CodableNutrientConversionFactor]?
    let isHistoricalReference: Bool
    let ndbNumber: Int
    let dataType: CodableFoundationFoodDataType
    let foodCategory: CodableFoodCategory
    let fdcID: Int
    let foodPortions: [CodableFoundationFoodFoodPortion]?
    let publicationDate: String
    let inputFoods: [CodableFoundationFoodInputFood]?
    let scientificName: String?

    enum CodingKeys: String, CodingKey {
        case foodClass, description, foodNutrients, foodAttributes, nutrientConversionFactors, isHistoricalReference, ndbNumber, dataType, foodCategory
        case fdcID = "fdcId"
        case foodPortions, publicationDate, inputFoods, scientificName
    }
}

// MARK: CodableFoundationFood convenience initializers and mutators
extension CodableFoundationFood {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFoundationFood.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        foodClass: String? = nil,
        description: String? = nil,
        foodNutrients: [CodableFoundationFoodFoodNutrient]? = nil,
        foodAttributes: [JSONAny]? = nil,
        nutrientConversionFactors: [CodableNutrientConversionFactor]?? = nil,
        isHistoricalReference: Bool? = nil,
        ndbNumber: Int? = nil,
        dataType: CodableFoundationFoodDataType? = nil,
        foodCategory: CodableFoodCategory? = nil,
        fdcID: Int? = nil,
        foodPortions: [CodableFoundationFoodFoodPortion]?? = nil,
        publicationDate: String? = nil,
        inputFoods: [CodableFoundationFoodInputFood]?? = nil,
        scientificName: String?? = nil
    ) -> CodableFoundationFood {
        return CodableFoundationFood(
            foodClass: foodClass ?? self.foodClass,
            description: description ?? self.description,
            foodNutrients: foodNutrients ?? self.foodNutrients,
            foodAttributes: foodAttributes ?? self.foodAttributes,
            nutrientConversionFactors: nutrientConversionFactors ?? self.nutrientConversionFactors,
            isHistoricalReference: isHistoricalReference ?? self.isHistoricalReference,
            ndbNumber: ndbNumber ?? self.ndbNumber,
            dataType: dataType ?? self.dataType,
            foodCategory: foodCategory ?? self.foodCategory,
            fdcID: fdcID ?? self.fdcID,
            foodPortions: foodPortions ?? self.foodPortions,
            publicationDate: publicationDate ?? self.publicationDate,
            inputFoods: inputFoods ?? self.inputFoods,
            scientificName: scientificName ?? self.scientificName
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum CodableFoundationFoodDataType: String, Codable {
    case foundation = "Foundation"
}

// MARK: - CodableFoodCategory
struct CodableFoodCategory: Codable {
    let description: String
}

// MARK: CodableFoodCategory convenience initializers and mutators
extension CodableFoodCategory {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFoodCategory.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        description: String? = nil
    ) -> CodableFoodCategory {
        return CodableFoodCategory(
            description: description ?? self.description
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Removed FoodCategoryDescription enum

// Removed FoundationFoodFoodClass enum

// MARK: - CodableFoundationFoodFoodNutrient
struct CodableFoundationFoodFoodNutrient: Codable {
    let type: String
    let id: Int
    let nutrient: CodableNutrient
    let dataPoints: Int?
    let foodNutrientDerivation: CodableFoodNutrientDerivation
    let median, amount, max, min: Double?
    let footnote: String?
}

// MARK: CodableFoundationFoodFoodNutrient convenience initializers and mutators

extension CodableFoundationFoodFoodNutrient {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFoundationFoodFoodNutrient.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: String? = nil,
        id: Int? = nil,
        nutrient: CodableNutrient? = nil,
        dataPoints: Int?? = nil,
        foodNutrientDerivation: CodableFoodNutrientDerivation? = nil,
        median: Double?? = nil,
        amount: Double?? = nil,
        max: Double?? = nil,
        min: Double?? = nil,
        footnote: String?? = nil
    ) -> CodableFoundationFoodFoodNutrient {
        return CodableFoundationFoodFoodNutrient(
            type: type ?? self.type,
            id: id ?? self.id,
            nutrient: nutrient ?? self.nutrient,
            dataPoints: dataPoints ?? self.dataPoints,
            foodNutrientDerivation: foodNutrientDerivation ?? self.foodNutrientDerivation,
            median: median ?? self.median,
            amount: amount ?? self.amount,
            max: max ?? self.max,
            min: min ?? self.min,
            footnote: footnote ?? self.footnote
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Removed Code enum
// Removed FoodNutrientDerivationDescription enum

// MARK: - CodableFoodNutrientDerivation
struct CodableFoodNutrientDerivation: Codable {
    let code: String?
    let description: String?
    let foodNutrientSource: CodableFood
}

// MARK: CodableFoodNutrientDerivation convenience initializers and mutators

extension CodableFoodNutrientDerivation {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFoodNutrientDerivation.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        code: String?? = nil,
        description: String?? = nil,
        foodNutrientSource: CodableFood? = nil
    ) -> CodableFoodNutrientDerivation {
        return CodableFoodNutrientDerivation(
            code: code ?? self.code,
            description: description ?? self.description,
            foodNutrientSource: foodNutrientSource ?? self.foodNutrientSource
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CodableFood
struct CodableFood: Codable {
    let id: Int?
    let code: String?
    let description: String?
}

// MARK: CodableFood convenience initializers and mutators

extension CodableFood {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFood.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        code: String?? = nil,
        description: String?? = nil
    ) -> CodableFood {
        return CodableFood(
            id: id ?? self.id,
            code: code ?? self.code,
            description: description ?? self.description
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CodableNutrient
struct CodableNutrient: Codable {
    let id: Int
    let number: String
    let name: String
    let rank: Int
    let unitName: String
}

// MARK: CodableNutrient convenience initializers and mutators

extension CodableNutrient {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableNutrient.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        number: String? = nil,
        name: String? = nil,
        rank: Int? = nil,
        unitName: String? = nil
    ) -> CodableNutrient {
        return CodableNutrient(
            id: id ?? self.id,
            number: number ?? self.number,
            name: name ?? self.name,
            rank: rank ?? self.rank,
            unitName: unitName ?? self.unitName
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Removed NutrientName enum
// Removed UnitName enum
// Removed FoodNutrientType enum

// MARK: - CodableFoundationFoodFoodPortion
struct CodableFoundationFoodFoodPortion: Codable {
    let id: Int
    let value: Double
    let measureUnit: CodableMeasureUnit
    let modifier: String?
    let gramWeight: Double
    let sequenceNumber: Int
    let amount: Double
    let minYearAcquired: Int
}

// MARK: CodableFoundationFoodFoodPortion convenience initializers and mutators

extension CodableFoundationFoodFoodPortion {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFoundationFoodFoodPortion.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        value: Double? = nil,
        measureUnit: CodableMeasureUnit? = nil,
        modifier: String?? = nil,
        gramWeight: Double? = nil,
        sequenceNumber: Int? = nil,
        amount: Double? = nil,
        minYearAcquired: Int? = nil
    ) -> CodableFoundationFoodFoodPortion {
        return CodableFoundationFoodFoodPortion(
            id: id ?? self.id,
            value: value ?? self.value,
            measureUnit: measureUnit ?? self.measureUnit,
            modifier: modifier ?? self.modifier,
            gramWeight: gramWeight ?? self.gramWeight,
            sequenceNumber: sequenceNumber ?? self.sequenceNumber,
            amount: amount ?? self.amount,
            minYearAcquired: minYearAcquired ?? self.minYearAcquired
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CodableMeasureUnit
struct CodableMeasureUnit: Codable {
    let id: Int
    let name, abbreviation: String
}

// MARK: CodableMeasureUnit convenience initializers and mutators

extension CodableMeasureUnit {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableMeasureUnit.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        name: String? = nil,
        abbreviation: String? = nil
    ) -> CodableMeasureUnit {
        return CodableMeasureUnit(
            id: id ?? self.id,
            name: name ?? self.name,
            abbreviation: abbreviation ?? self.abbreviation
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Removed Abbreviation enum

// MARK: - CodableFoundationFoodInputFood
struct CodableFoundationFoodInputFood: Codable {
    let id: Int
    let foodDescription: String
    let inputFood: CodableInputFoodInputFood
}

// MARK: CodableFoundationFoodInputFood convenience initializers and mutators

extension CodableFoundationFoodInputFood {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFoundationFoodInputFood.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        foodDescription: String? = nil,
        inputFood: CodableInputFoodInputFood? = nil
    ) -> CodableFoundationFoodInputFood {
        return CodableFoundationFoodInputFood(
            id: id ?? self.id,
            foodDescription: foodDescription ?? self.foodDescription,
            inputFood: inputFood ?? self.inputFood
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CodableInputFoodInputFood
struct CodableInputFoodInputFood: Codable {
    let foodClass: String
    let description: String
    let dataType: String
    let foodCategory: CodableFood
    let fdcID: Int
    let publicationDate: String

    enum CodingKeys: String, CodingKey {
        case foodClass, description, dataType, foodCategory
        case fdcID = "fdcId"
        case publicationDate
    }
}

// MARK: CodableInputFoodInputFood convenience initializers and mutators

extension CodableInputFoodInputFood {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableInputFoodInputFood.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        foodClass: String? = nil,
        description: String? = nil,
        dataType: String? = nil,
        foodCategory: CodableFood? = nil,
        fdcID: Int? = nil,
        publicationDate: String? = nil
    ) -> CodableInputFoodInputFood {
        return CodableInputFoodInputFood(
            foodClass: foodClass ?? self.foodClass,
            description: description ?? self.description,
            dataType: dataType ?? self.dataType,
            foodCategory: foodCategory ?? self.foodCategory,
            fdcID: fdcID ?? self.fdcID,
            publicationDate: publicationDate ?? self.publicationDate
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Removed InputFoodDataType enum
// Removed InputFoodFoodClass enum
// Removed PublicationDate enum

// MARK: - CodableNutrientConversionFactor
struct CodableNutrientConversionFactor: Codable {
    let type: String
    let proteinValue, fatValue, carbohydrateValue, value: Double?
    let nitrogenValue: Double?
}

// MARK: CodableNutrientConversionFactor convenience initializers and mutators

extension CodableNutrientConversionFactor {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableNutrientConversionFactor.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: String? = nil,
        proteinValue: Double?? = nil,
        fatValue: Double?? = nil,
        carbohydrateValue: Double?? = nil,
        value: Double?? = nil,
        nitrogenValue: Double?? = nil
    ) -> CodableNutrientConversionFactor {
        return CodableNutrientConversionFactor(
            type: type ?? self.type,
            proteinValue: proteinValue ?? self.proteinValue,
            fatValue: fatValue ?? self.fatValue,
            carbohydrateValue: carbohydrateValue ?? self.carbohydrateValue,
            value: value ?? self.value,
            nitrogenValue: nitrogenValue ?? self.nitrogenValue
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Removed NutrientConversionFactorType enum

// MARK: - CodableSurveyFood
struct CodableSurveyFood: Codable {
    let foodClass: String
    let description: String
    let footnote: String?
    let foodNutrients: [CodableSurveyFoodFoodNutrient]
    let foodAttributes: [CodableFoodAttribute]
    let foodCode: String
    let startDate: String
    let endDate: String
    let wweiaFoodCategory: CodableWweiaFoodCategory
    let dataType: String
    let fdcID: Int
    let foodPortions: [CodableSurveyFoodFoodPortion]
    let publicationDate: String
    let inputFoods: [CodableSurveyFoodInputFood]

    enum CodingKeys: String, CodingKey {
        case foodClass, description, footnote, foodNutrients, foodAttributes, foodCode, startDate, endDate, wweiaFoodCategory, dataType
        case fdcID = "fdcId"
        case foodPortions, publicationDate, inputFoods
    }
}

// MARK: CodableSurveyFood convenience initializers and mutators

extension CodableSurveyFood {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableSurveyFood.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        foodClass: String? = nil,
        description: String? = nil,
        footnote: String?? = nil,
        foodNutrients: [CodableSurveyFoodFoodNutrient]? = nil,
        foodAttributes: [CodableFoodAttribute]? = nil,
        foodCode: String? = nil,
        startDate: String? = nil,
        endDate: String? = nil,
        wweiaFoodCategory: CodableWweiaFoodCategory? = nil,
        dataType: String? = nil,
        fdcID: Int? = nil,
        foodPortions: [CodableSurveyFoodFoodPortion]? = nil,
        publicationDate: String? = nil,
        inputFoods: [CodableSurveyFoodInputFood]? = nil
    ) -> CodableSurveyFood {
        return CodableSurveyFood(
            foodClass: foodClass ?? self.foodClass,
            description: description ?? self.description,
            footnote: footnote ?? self.footnote,
            foodNutrients: foodNutrients ?? self.foodNutrients,
            foodAttributes: foodAttributes ?? self.foodAttributes,
            foodCode: foodCode ?? self.foodCode,
            startDate: startDate ?? self.startDate,
            endDate: endDate ?? self.endDate,
            wweiaFoodCategory: wweiaFoodCategory ?? self.wweiaFoodCategory,
            dataType: dataType ?? self.dataType,
            fdcID: fdcID ?? self.fdcID,
            foodPortions: foodPortions ?? self.foodPortions,
            publicationDate: publicationDate ?? self.publicationDate,
            inputFoods: inputFoods ?? self.inputFoods
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Removed SurveyFoodDataType enum
// Removed EndDate enum

// MARK: - CodableFoodAttribute
struct CodableFoodAttribute: Codable {
    let id: Int
    let name: String?
    let value: String
    let foodAttributeType: CodableFoodAttributeType
    let rank: Int?
}

// MARK: CodableFoodAttribute convenience initializers and mutators

extension CodableFoodAttribute {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFoodAttribute.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        name: String?? = nil,
        value: String? = nil,
        foodAttributeType: CodableFoodAttributeType? = nil,
        rank: Int?? = nil
    ) -> CodableFoodAttribute {
        return CodableFoodAttribute(
            id: id ?? self.id,
            name: name ?? self.name,
            value: value ?? self.value,
            foodAttributeType: foodAttributeType ?? self.foodAttributeType,
            rank: rank ?? self.rank
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CodableFoodAttributeType
struct CodableFoodAttributeType: Codable {
    let id: Int
    let name: String
    let description: String
}

// MARK: CodableFoodAttributeType convenience initializers and mutators

extension CodableFoodAttributeType {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableFoodAttributeType.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        name: String? = nil,
        description: String? = nil
    ) -> CodableFoodAttributeType {
        return CodableFoodAttributeType(
            id: id ?? self.id,
            name: name ?? self.name,
            description: description ?? self.description
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CodableSurveyFoodFoodNutrient
struct CodableSurveyFoodFoodNutrient: Codable {
    let type: String
    let id: Int
    let nutrient: CodableNutrient
    let amount: Double
}

// MARK: CodableSurveyFoodFoodNutrient convenience initializers and mutators

extension CodableSurveyFoodFoodNutrient {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableSurveyFoodFoodNutrient.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: String? = nil,
        id: Int? = nil,
        nutrient: CodableNutrient? = nil,
        amount: Double? = nil
    ) -> CodableSurveyFoodFoodNutrient {
        return CodableSurveyFoodFoodNutrient(
            type: type ?? self.type,
            id: id ?? self.id,
            nutrient: nutrient ?? self.nutrient,
            amount: amount ?? self.amount
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CodableSurveyFoodFoodPortion
struct CodableSurveyFoodFoodPortion: Codable {
    let id: Int
    let measureUnit: CodableMeasureUnit
    let modifier: String
    let gramWeight: Double
    let portionDescription: String
    let sequenceNumber: Int
}

// MARK: CodableSurveyFoodFoodPortion convenience initializers and mutators

extension CodableSurveyFoodFoodPortion {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableSurveyFoodFoodPortion.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        measureUnit: CodableMeasureUnit? = nil,
        modifier: String? = nil,
        gramWeight: Double? = nil,
        portionDescription: String? = nil,
        sequenceNumber: Int? = nil
    ) -> CodableSurveyFoodFoodPortion {
        return CodableSurveyFoodFoodPortion(
            id: id ?? self.id,
            measureUnit: measureUnit ?? self.measureUnit,
            modifier: modifier ?? self.modifier,
            gramWeight: gramWeight ?? self.gramWeight,
            portionDescription: portionDescription ?? self.portionDescription,
            sequenceNumber: sequenceNumber ?? self.sequenceNumber
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CodableSurveyFoodInputFood
struct CodableSurveyFoodInputFood: Codable {
    let id: Int
    let unit: String
    let portionDescription: String
    let portionCode, foodDescription: String
    let retentionCode: Int
    let ingredientWeight: Double
    let ingredientCode: Int
    let ingredientDescription: String
    let amount: Double
    let sequenceNumber: Int
}

// MARK: CodableSurveyFoodInputFood convenience initializers and mutators

extension CodableSurveyFoodInputFood {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableSurveyFoodInputFood.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        unit: String? = nil,
        portionDescription: String? = nil,
        portionCode: String? = nil,
        foodDescription: String? = nil,
        retentionCode: Int? = nil,
        ingredientWeight: Double? = nil,
        ingredientCode: Int? = nil,
        ingredientDescription: String? = nil,
        amount: Double? = nil,
        sequenceNumber: Int? = nil
    ) -> CodableSurveyFoodInputFood {
        return CodableSurveyFoodInputFood(
            id: id ?? self.id,
            unit: unit ?? self.unit,
            portionDescription: portionDescription ?? self.portionDescription,
            portionCode: portionCode ?? self.portionCode,
            foodDescription: foodDescription ?? self.foodDescription,
            retentionCode: retentionCode ?? self.retentionCode,
            ingredientWeight: ingredientWeight ?? self.ingredientWeight,
            ingredientCode: ingredientCode ?? self.ingredientCode,
            ingredientDescription: ingredientDescription ?? self.ingredientDescription,
            amount: amount ?? self.amount,
            sequenceNumber: sequenceNumber ?? self.sequenceNumber
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Removed PortionDescription enum
// Removed Unit enum
// Removed StartDate enum

// MARK: - CodableWweiaFoodCategory
struct CodableWweiaFoodCategory: Codable {
    let wweiaFoodCategoryDescription: String
    let wweiaFoodCategoryCode: Int
}

// MARK: CodableWweiaFoodCategory convenience initializers and mutators

extension CodableWweiaFoodCategory {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CodableWweiaFoodCategory.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        wweiaFoodCategoryDescription: String? = nil,
        wweiaFoodCategoryCode: Int? = nil
    ) -> CodableWweiaFoodCategory {
        return CodableWweiaFoodCategory(
            wweiaFoodCategoryDescription: wweiaFoodCategoryDescription ?? self.wweiaFoodCategoryDescription,
            wweiaFoodCategoryCode: wweiaFoodCategoryCode ?? self.wweiaFoodCategoryCode
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
            return nil
    }

    required init?(stringValue: String) {
            key = stringValue
    }

    var intValue: Int? {
            return nil
    }

    var stringValue: String {
            return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                    return value
            }
            if let value = try? container.decode(Int64.self) {
                    return value
            }
            if let value = try? container.decode(Double.self) {
                    return value
            }
            if let value = try? container.decode(String.self) {
                    return value
            }
            if container.decodeNil() {
                    return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                    return value
            }
            if let value = try? container.decode(Int64.self) {
                    return value
            }
            if let value = try? container.decode(Double.self) {
                    return value
            }
            if let value = try? container.decode(String.self) {
                    return value
            }
            if let value = try? container.decodeNil() {
                    if value {
                            return JSONNull()
                    }
            }
            if var container = try? container.nestedUnkeyedContainer() {
                    return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                    return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
            if let value = try? container.decode(Bool.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(Int64.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(Double.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(String.self, forKey: key) {
                    return value
            }
            if let value = try? container.decodeNil(forKey: key) {
                    if value {
                            return JSONNull()
                    }
            }
            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                    return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                    return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
            var arr: [Any] = []
            while !container.isAtEnd {
                    let value = try decode(from: &container)
                    arr.append(value)
            }
            return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                    let value = try decode(from: &container, forKey: key)
                    dict[key.stringValue] = value
            }
            return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                    if let value = value as? Bool {
                            try container.encode(value)
                    } else if let value = value as? Int64 {
                            try container.encode(value)
                    } else if let value = value as? Double {
                            try container.encode(value)
                    } else if let value = value as? String {
                            try container.encode(value)
                    } else if value is JSONNull {
                            try container.encodeNil()
                    } else if let value = value as? [Any] {
                            var container = container.nestedUnkeyedContainer()
                            try encode(to: &container, array: value)
                    } else if let value = value as? [String: Any] {
                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                            try encode(to: &container, dictionary: value)
                    } else {
                            throw encodingError(forValue: value, codingPath: container.codingPath)
                    }
            }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                    let key = JSONCodingKey(stringValue: key)!
                    if let value = value as? Bool {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? Int64 {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? Double {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? String {
                            try container.encode(value, forKey: key)
                    } else if value is JSONNull {
                            try container.encodeNil(forKey: key)
                    } else if let value = value as? [Any] {
                            var container = container.nestedUnkeyedContainer(forKey: key)
                            try encode(to: &container, array: value)
                    } else if let value = value as? [String: Any] {
                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                            try encode(to: &container, dictionary: value)
                    } else {
                            throw encodingError(forValue: value, codingPath: container.codingPath)
                    }
            }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if let value = value as? Bool {
                    try container.encode(value)
            } else if let value = value as? Int64 {
                    try container.encode(value)
            } else if let value = value as? Double {
                    try container.encode(value)
            } else if let value = value as? String {
                    try container.encode(value)
            } else if value is JSONNull {
                    try container.encodeNil()
            } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
            }
    }

    public required init(from decoder: Decoder) throws {
            if var arrayContainer = try? decoder.unkeyedContainer() {
                    self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                    self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
                    let container = try decoder.singleValueContainer()
                    self.value = try JSONAny.decode(from: container)
            }
    }

    public func encode(to encoder: Encoder) throws {
            if let arr = self.value as? [Any] {
                    var container = encoder.unkeyedContainer()
                    try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
                    var container = encoder.container(keyedBy: JSONCodingKey.self)
                    try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                    var container = encoder.singleValueContainer()
                    try JSONAny.encode(to: &container, value: self.value)
            }
    }
}
