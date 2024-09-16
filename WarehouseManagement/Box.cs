using System;

public class Box
{
    public string ID { get; set; }
    public double Width { get; set; }
    public double Height { get; set; }
    public double Depth { get; set; }
    public double Weight { get; set; }
    public DateTime? ExpirationDate { get; set; }
    public DateTime? ProductionDate { get; set; }

    public Box(string id, double width, double height, double depth, double weight, DateTime? expirationDate = null, DateTime? productionDate = null)
    {
        ID = id;
        Width = width;
        Height = height;
        Depth = depth;
        Weight = weight;

        // Приоритетно использовать ExpirationDate, если она указана, иначе вычислять по ProductionDate
        ExpirationDate = expirationDate ?? productionDate?.AddDays(100);
        ProductionDate = productionDate;
    }

    public double Volume => Width * Height * Depth;
}
