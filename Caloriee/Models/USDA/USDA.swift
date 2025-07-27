//
//  USDA.swift
//  Caloriee
//
//  Created by Ben Haefner on 7/26/25.
//
// This file was generated from JSON Schema using quicktype

import Foundation
import SwiftData

// MARK: - FoundationFood
@Model
class FoundationFood {
    var foodClass: String
    var foundationFoodDescription: String
    var foodNutrients: [FoundationFoodFoodNutrient]
    var foodAttributes: [FoodAttribute]
    var nutrientConversionFactors: [NutrientConversionFactor]?
    var isHistoricalReference: Bool
    var ndbNumber: Int
    var dataType: String
    var foodCategory: FoodCategory
    var fdcID: Int
    var foodPortions: [FoundationFoodFoodPortion]?
    var publicationDate: String
    var inputFoods: [FoundationFoodInputFood]?
    var scientificName: String?

    init(foodClass: String, description: String, foodNutrients: [FoundationFoodFoodNutrient], foodAttributes: [FoodAttribute], nutrientConversionFactors: [NutrientConversionFactor]?, isHistoricalReference: Bool, ndbNumber: Int, dataType: String, foodCategory: FoodCategory, fdcID: Int, foodPortions: [FoundationFoodFoodPortion]?, publicationDate: String, inputFoods: [FoundationFoodInputFood]?, scientificName: String?) {
        self.foodClass = foodClass
        self.foundationFoodDescription = description
        self.foodNutrients = foodNutrients
        self.foodAttributes = foodAttributes
        self.nutrientConversionFactors = nutrientConversionFactors
        self.isHistoricalReference = isHistoricalReference
        self.ndbNumber = ndbNumber
        self.dataType = dataType
        self.foodCategory = foodCategory
        self.fdcID = fdcID
        self.foodPortions = foodPortions
        self.publicationDate = publicationDate
        self.inputFoods = inputFoods
        self.scientificName = scientificName
    }
}

// MARK: - FoodCategory
@Model
class FoodCategory {
    var categoryDescription: String

    init(description: String) {
        self.categoryDescription = description
    }
}

// MARK: - FoundationFoodFoodNutrient
@Model
class FoundationFoodFoodNutrient {
    var type: String
    var id: Int
    var nutrient: Nutrient
    var dataPoints: Int?
    var foodNutrientDerivation: FoodNutrientDerivation
    var median: Double?
    var amount: Double?
    var max: Double?
    var min: Double?
    var footnote: String?

    init(type: String, id: Int, nutrient: Nutrient, dataPoints: Int?, foodNutrientDerivation: FoodNutrientDerivation, median: Double?, amount: Double?, max: Double?, min: Double?, footnote: String?) {
        self.type = type
        self.id = id
        self.nutrient = nutrient
        self.dataPoints = dataPoints
        self.foodNutrientDerivation = foodNutrientDerivation
        self.median = median
        self.amount = amount
        self.max = max
        self.min = min
        self.footnote = footnote
    }
}

// MARK: - FoodNutrientDerivation
@Model
class FoodNutrientDerivation {
    var code: String?
    var derevationDescription: String?
    var foodNutrientSource: Food

    init(code: String?, description: String?, foodNutrientSource: Food) {
        self.code = code
        self.derevationDescription = description
        self.foodNutrientSource = foodNutrientSource
    }
}

// MARK: - Food
@Model
class Food {
    var id: Int?
    var code: String?
    var foodDescription: String?

    init(id: Int?, code: String?, description: String?) {
        self.id = id
        self.code = code
        self.foodDescription = description
    }
}

// MARK: - Nutrient
@Model
class Nutrient {
    var id: Int
    var number: String
    var name: String
    var rank: Int
    var unitName: String

    init(id: Int, number: String, name: String, rank: Int, unitName: String) {
        self.id = id
        self.number = number
        self.name = name
        self.rank = rank
        self.unitName = unitName
    }
}

// MARK: - FoundationFoodFoodPortion
@Model
class FoundationFoodFoodPortion {
    var id: Int
    var value: Double
    var measureUnit: MeasureUnit
    var modifier: String?
    var gramWeight: Double
    var sequenceNumber: Int
    var amount: Double
    var minYearAcquired: Int

    init(id: Int, value: Double, measureUnit: MeasureUnit, modifier: String?, gramWeight: Double, sequenceNumber: Int, amount: Double, minYearAcquired: Int) {
        self.id = id
        self.value = value
        self.measureUnit = measureUnit
        self.modifier = modifier
        self.gramWeight = gramWeight
        self.sequenceNumber = sequenceNumber
        self.amount = amount
        self.minYearAcquired = minYearAcquired
    }
}

// MARK: - MeasureUnit
@Model
class MeasureUnit {
    var id: Int
    var name: String
    var abbreviation: String

    init(id: Int, name: String, abbreviation: String) {
        self.id = id
        self.name = name
        self.abbreviation = abbreviation
    }
}

// MARK: - FoundationFoodInputFood
@Model
class FoundationFoodInputFood {
    var id: Int
    var foodDescription: String
    var inputFood: NestedInputFood

    init(id: Int, foodDescription: String, inputFood: NestedInputFood) {
        self.id = id
        self.foodDescription = foodDescription
        self.inputFood = inputFood
    }
}

// MARK: - NestedInputFood
@Model
class NestedInputFood {
    var foodClass: String
    var inputFoodDescription: String
    var dataType: String
    var foodCategory: Food
    var fdcID: Int
    var publicationDate: String

    enum CodingKeys: String, CodingKey {
        case foodClass, description, dataType, foodCategory
        case fdcID = "fdcId"
        case publicationDate
    }

    init(foodClass: String, description: String, dataType: String, foodCategory: Food, fdcID: Int, publicationDate: String) {
        self.foodClass = foodClass
        self.inputFoodDescription = description
        self.dataType = dataType
        self.foodCategory = foodCategory
        self.fdcID = fdcID
        self.publicationDate = publicationDate
    }
}

// MARK: - NutrientConversionFactor
@Model
class NutrientConversionFactor {
    var type: String
    var proteinValue: Double?
    var fatValue: Double?
    var carbohydrateValue: Double?
    var value: Double?
    var nitrogenValue: Double?

    init(type: String, proteinValue: Double?, fatValue: Double?, carbohydrateValue: Double?, value: Double?, nitrogenValue: Double?) {
        self.type = type
        self.proteinValue = proteinValue
        self.fatValue = fatValue
        self.carbohydrateValue = carbohydrateValue
        self.value = value
        self.nitrogenValue = nitrogenValue
    }
}

// MARK: - SurveyFood
@Model
class SurveyFood {
    var foodClass: String
    var surveyFoodDescription: String
    var footnote: String?
    var foodNutrients: [SurveyFoodFoodNutrient]
    var foodAttributes: [FoodAttribute]
    var foodCode: String
    var startDate: String
    var endDate: String
    var wweiaFoodCategory: WweiaFoodCategory
    var dataType: String
    var fdcID: Int
    var foodPortions: [SurveyFoodFoodPortion]
    var publicationDate: String
    var inputFoods: [SurveyFoodInputFood]

    enum CodingKeys: String, CodingKey {
        case foodClass, description, footnote, foodNutrients, foodAttributes, foodCode, startDate, endDate, wweiaFoodCategory, dataType
        case fdcID = "fdcId"
        case foodPortions, publicationDate, inputFoods
    }

    init(foodClass: String, description: String, footnote: String?, foodNutrients: [SurveyFoodFoodNutrient], foodAttributes: [FoodAttribute], foodCode: String, startDate: String, endDate: String, wweiaFoodCategory: WweiaFoodCategory, dataType: String, fdcID: Int, foodPortions: [SurveyFoodFoodPortion], publicationDate: String, inputFoods: [SurveyFoodInputFood]) {
        self.foodClass = foodClass
        self.surveyFoodDescription = description
        self.footnote = footnote
        self.foodNutrients = foodNutrients
        self.foodAttributes = foodAttributes
        self.foodCode = foodCode
        self.startDate = startDate
        self.endDate = endDate
        self.wweiaFoodCategory = wweiaFoodCategory
        self.dataType = dataType
        self.fdcID = fdcID
        self.foodPortions = foodPortions
        self.publicationDate = publicationDate
        self.inputFoods = inputFoods
    }
}

// MARK: - FoodAttribute
@Model
class FoodAttribute {
    var id: Int
    var name: String?
    var value: String
    var foodAttributeType: FoodAttributeType
    var rank: Int?

    init(id: Int, name: String?, value: String, foodAttributeType: FoodAttributeType, rank: Int?) {
        self.id = id
        self.name = name
        self.value = value
        self.foodAttributeType = foodAttributeType
        self.rank = rank
    }
}

// MARK: - FoodAttributeType
@Model
class FoodAttributeType {
    var id: Int
    var name: String
    var foodAttributeTypeDescription: String

    init(id: Int, name: String, description: String) {
        self.id = id
        self.name = name
        self.foodAttributeTypeDescription = description
    }
}

// MARK: - SurveyFoodFoodNutrient
@Model
class SurveyFoodFoodNutrient {
    var type: String
    var id: Int
    var nutrient: Nutrient
    var amount: Double

    init(type: String, id: Int, nutrient: Nutrient, amount: Double) {
        self.type = type
        self.id = id
        self.nutrient = nutrient
        self.amount = amount
    }
}

// MARK: - SurveyFoodFoodPortion
@Model
class SurveyFoodFoodPortion {
    var id: Int
    var measureUnit: MeasureUnit
    var modifier: String
    var gramWeight: Double
    var portionDescription: String
    var sequenceNumber: Int

    init(id: Int, measureUnit: MeasureUnit, modifier: String, gramWeight: Double, portionDescription: String, sequenceNumber: Int) {
        self.id = id
        self.measureUnit = measureUnit
        self.modifier = modifier
        self.gramWeight = gramWeight
        self.portionDescription = portionDescription
        self.sequenceNumber = sequenceNumber
    }
}

// MARK: - SurveyFoodInputFood
@Model
class SurveyFoodInputFood {
    var id: Int
    var unit: String
    var portionDescription: String
    var portionCode: String
    var foodDescription: String
    var retentionCode: Int
    var ingredientWeight: Double
    var ingredientCode: Int
    var ingredientDescription: String
    var amount: Double
    var sequenceNumber: Int

    init(id: Int, unit: String, portionDescription: String, portionCode: String, foodDescription: String, retentionCode: Int, ingredientWeight: Double, ingredientCode: Int, ingredientDescription: String, amount: Double, sequenceNumber: Int) {
        self.id = id
        self.unit = unit
        self.portionDescription = portionDescription
        self.portionCode = portionCode
        self.foodDescription = foodDescription
        self.retentionCode = retentionCode
        self.ingredientWeight = ingredientWeight
        self.ingredientCode = ingredientCode
        self.ingredientDescription = ingredientDescription
        self.amount = amount
        self.sequenceNumber = sequenceNumber
    }
}

// MARK: - WweiaFoodCategory
@Model
class WweiaFoodCategory {
    var wweiaFoodCategoryDescription: String
    var wweiaFoodCategoryCode: Int

    init(wweiaFoodCategoryDescription: String, wweiaFoodCategoryCode: Int) {
        self.wweiaFoodCategoryDescription = wweiaFoodCategoryDescription
        self.wweiaFoodCategoryCode = wweiaFoodCategoryCode
    }
}

// MARK: - Conversion from Codable Models

extension FoundationFood {
    convenience init(from codable: CodableFoundationFood) {
        self.init(
            foodClass: codable.foodClass,
            description: codable.description,
            foodNutrients: codable.foodNutrients.map { FoundationFoodFoodNutrient(from: $0) },
            foodAttributes: [], // Conversion from JSONAny to FoodAttribute requires a custom implementation
            nutrientConversionFactors: codable.nutrientConversionFactors?.map { NutrientConversionFactor(from: $0) },
            isHistoricalReference: codable.isHistoricalReference,
            ndbNumber: codable.ndbNumber,
            dataType: codable.dataType.rawValue,
            foodCategory: FoodCategory(from: codable.foodCategory),
            fdcID: codable.fdcID,
            foodPortions: codable.foodPortions?.map { FoundationFoodFoodPortion(from: $0) },
            publicationDate: codable.publicationDate,
            inputFoods: codable.inputFoods?.map { FoundationFoodInputFood(from: $0) },
            scientificName: codable.scientificName
        )
    }
}

extension FoodCategory {
    convenience init(from codable: CodableFoodCategory) {
        self.init(description: codable.description)
    }
}

extension FoundationFoodFoodNutrient {
    convenience init(from codable: CodableFoundationFoodFoodNutrient) {
        self.init(
            type: codable.type,
            id: codable.id,
            nutrient: Nutrient(from: codable.nutrient),
            dataPoints: codable.dataPoints,
            foodNutrientDerivation: FoodNutrientDerivation(from: codable.foodNutrientDerivation),
            median: codable.median,
            amount: codable.amount,
            max: codable.max,
            min: codable.min,
            footnote: codable.footnote
        )
    }
}

extension FoodNutrientDerivation {
    convenience init(from codable: CodableFoodNutrientDerivation) {
        self.init(
            code: codable.code,
            description: codable.description,
            foodNutrientSource: Food(from: codable.foodNutrientSource)
        )
    }
}

extension Food {
    convenience init(from codable: CodableFood) {
        self.init(id: codable.id, code: codable.code, description: codable.description)
    }
}

extension Nutrient {
    convenience init(from codable: CodableNutrient) {
        self.init(
            id: codable.id,
            number: codable.number,
            name: codable.name,
            rank: codable.rank,
            unitName: codable.unitName
        )
    }
}

extension FoundationFoodFoodPortion {
    convenience init(from codable: CodableFoundationFoodFoodPortion) {
        self.init(
            id: codable.id,
            value: codable.value,
            measureUnit: MeasureUnit(from: codable.measureUnit),
            modifier: codable.modifier,
            gramWeight: codable.gramWeight,
            sequenceNumber: codable.sequenceNumber,
            amount: codable.amount,
            minYearAcquired: codable.minYearAcquired
        )
    }
}

extension MeasureUnit {
    convenience init(from codable: CodableMeasureUnit) {
        self.init(id: codable.id, name: codable.name, abbreviation: codable.abbreviation)
    }
}

extension FoundationFoodInputFood {
    convenience init(from codable: CodableFoundationFoodInputFood) {
        self.init(
            id: codable.id,
            foodDescription: codable.foodDescription,
            inputFood: NestedInputFood(from: codable.inputFood)
        )
    }
}

extension NestedInputFood {
    convenience init(from codable: CodableNestedInputFood) {
        self.init(
            foodClass: codable.foodClass,
            description: codable.description,
            dataType: codable.dataType,
            foodCategory: Food(from: codable.foodCategory),
            fdcID: codable.fdcID,
            publicationDate: codable.publicationDate
        )
    }
}

extension NutrientConversionFactor {
    convenience init(from codable: CodableNutrientConversionFactor) {
        self.init(
            type: codable.type,
            proteinValue: codable.proteinValue,
            fatValue: codable.fatValue,
            carbohydrateValue: codable.carbohydrateValue,
            value: codable.value,
            nitrogenValue: codable.nitrogenValue
        )
    }
}

// NOTE: You may need to add similar extensions for SurveyFood and related types if you use them.
// NOTE: For foodAttributes, conversion from JSONAny to FoodAttribute requires a custom approach based on your JSON structure.

// MARK: - Conversion from Codable SurveyFood Models

extension SurveyFood {
    convenience init(from codable: CodableSurveyFood) {
        self.init(
            foodClass: codable.foodClass,
            description: codable.description,
            footnote: codable.footnote,
            foodNutrients: codable.foodNutrients.map { SurveyFoodFoodNutrient(from: $0) },
            foodAttributes: codable.foodAttributes.map { FoodAttribute(from: $0) },
            foodCode: codable.foodCode,
            startDate: codable.startDate,
            endDate: codable.endDate,
            wweiaFoodCategory: WweiaFoodCategory(from: codable.wweiaFoodCategory),
            dataType: codable.dataType,
            fdcID: codable.fdcID,
            foodPortions: codable.foodPortions.map { SurveyFoodFoodPortion(from: $0) },
            publicationDate: codable.publicationDate,
            inputFoods: codable.inputFoods.map { SurveyFoodInputFood(from: $0) }
        )
    }
}

extension WweiaFoodCategory {
    convenience init(from codable: CodableWweiaFoodCategory) {
        self.init(
            wweiaFoodCategoryDescription: codable.wweiaFoodCategoryDescription,
            wweiaFoodCategoryCode: codable.wweiaFoodCategoryCode
        )
    }
}

extension SurveyFoodFoodNutrient {
    convenience init(from codable: CodableSurveyFoodFoodNutrient) {
        self.init(
            type: codable.type,
            id: codable.id,
            nutrient: Nutrient(from: codable.nutrient),
            amount: codable.amount
        )
    }
}

extension SurveyFoodFoodPortion {
    convenience init(from codable: CodableSurveyFoodFoodPortion) {
        self.init(
            id: codable.id,
            measureUnit: MeasureUnit(from: codable.measureUnit),
            modifier: codable.modifier,
            gramWeight: codable.gramWeight,
            portionDescription: codable.portionDescription,
            sequenceNumber: codable.sequenceNumber
        )
    }
}

extension SurveyFoodInputFood {
    convenience init(from codable: CodableSurveyFoodInputFood) {
        self.init(
            id: codable.id,
            unit: codable.unit,
            portionDescription: codable.portionDescription,
            portionCode: codable.portionCode,
            foodDescription: codable.foodDescription,
            retentionCode: codable.retentionCode,
            ingredientWeight: codable.ingredientWeight,
            ingredientCode: codable.ingredientCode,
            ingredientDescription: codable.ingredientDescription,
            amount: codable.amount,
            sequenceNumber: codable.sequenceNumber
        )
    }
}

extension FoodAttribute {
    convenience init(from codable: CodableFoodAttribute) {
        self.init(
            id: codable.id,
            name: codable.name,
            value: codable.value,
            foodAttributeType: FoodAttributeType(from: codable.foodAttributeType),
            rank: codable.rank
        )
    }
}

extension FoodAttributeType {
    convenience init(from codable: CodableFoodAttributeType) {
        self.init(
            id: codable.id,
            name: codable.name,
            description: codable.description
        )
    }
}

