using System.Collections.Generic;
using System;
using System.Linq;

public class Pallet
{
    public string ID { get; set; }
    public double Width { get; set; }
    public double Height { get; set; }
    public double Depth { get; set; }
    public List<Box> Boxes { get; set; } = new List<Box>();

    public Pallet(string id, double width, double height, double depth)
    {
        ID = id;
        Width = width;
        Height = height;
        Depth = depth;
    }

    public double Volume => Width * Height * Depth + Boxes.Sum(box => box.Volume);

    public double Weight => Boxes.Sum(box => box.Weight) + 30;

    public DateTime? ExpirationDate
    {
        get
        {
            // Собираем все даты срока годности или вычисляем их на основе ProductionDate
            var expirationDates = Boxes
                .Select(box => box.ExpirationDate) 
                .Where(date => date.HasValue) 
                .Select(date => date.Value);  

            // Возвращаем минимальный срок годности, если он есть
            return expirationDates.Any() ? (DateTime?)expirationDates.Min() : null;
        }
    }
}
