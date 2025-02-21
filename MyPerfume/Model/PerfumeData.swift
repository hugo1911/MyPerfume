import Foundation
import SwiftUI
import Observation

@Observable
class PerfumeData: Identifiable, Decodable {
    var id: UUID
    var name: String
    var brand: String
    var price: Double
    var description: String
    var perfumeImage: UIImage
    var notes: [String]
    
    // Define las claves de codificación
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case brand
        case price
        case description
        case imageData // Notar que usamos imageData en lugar de perfumeImage
        case notes
    }
    
    // Implementación requerida del inicializador Decodable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decodifica los valores simples
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        brand = try container.decode(String.self, forKey: .brand)
        price = try container.decode(Double.self, forKey: .price)
        description = try container.decode(String.self, forKey: .description)
        notes = try container.decode([String].self, forKey: .notes)
        
        // Maneja la decodificación de la imagen
        if let imageData = try container.decodeIfPresent(Data.self, forKey: .imageData),
           let image = UIImage(data: imageData) {
            perfumeImage = image
        } else {
            // Proporciona una imagen por defecto si no hay datos
            perfumeImage = UIImage(systemName: "photo") ?? UIImage()
        }
    }
    
    // Constructor normal
    init(id: UUID = UUID(),
         name: String,
         brand: String,
         price: Double,
         description: String,
         perfumeImage: UIImage,
         notes: [String]) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.description = description
        self.perfumeImage = perfumeImage
        self.notes = notes
    }
}

// Extensión para hacer la clase también Encodable si lo necesitas
extension PerfumeData: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(brand, forKey: .brand)
        try container.encode(price, forKey: .price)
        try container.encode(description, forKey: .description)
        try container.encode(notes, forKey: .notes)
        
        // Codifica la imagen como Data
        let imageData = perfumeImage.jpegData(compressionQuality: 0.8)
        try container.encode(imageData, forKey: .imageData)
    }
}
