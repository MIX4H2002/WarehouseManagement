using System;

public class Program
{
    static void Main(string[] args)
    {
        var dataService = new DataService();
        var warehouse = new Warehouse();

        var pallets = dataService.GetPallets();
        foreach (var pallet in pallets)
        {
            warehouse.AddPallet(pallet);
        }

        Console.WriteLine("Паллеты, отсортированные по сроку годности:");
        foreach (var group in warehouse.GroupByExpirationDate())
        {
            Console.WriteLine($"Срок годности: {group.Key?.ToString("dd.MM.yyyy") ?? "Неизвестен"}");
            foreach (var pallet in group)
            {
                Console.WriteLine($"  Паллет ID: {pallet.ID}, Вес: {pallet.Weight} кг");
            }
        }

        Console.WriteLine("\n3 паллеты с наибольшим сроком годности, отсортированные по объему:");
        foreach (var pallet in warehouse.GetTop3ByLongestExpiration())
        {
            Console.WriteLine($"Паллет ID: {pallet.ID}, Срок годности: {pallet.ExpirationDate?.ToString("dd.MM.yyyy")}, Объем: {pallet.Volume}");
        }

        Console.WriteLine("\nНажмите Enter, чтобы завершить программу...");
        Console.ReadLine();
    }
}
