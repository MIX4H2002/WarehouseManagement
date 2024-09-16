using System;
using System.Collections.Generic;
using System.Linq;

public class Warehouse
{
    public List<Pallet> Pallets { get; set; } = new List<Pallet>();

    public void AddPallet(Pallet pallet)
    {
        Pallets.Add(pallet);
    }

    // Группировка паллет по минимальному сроку годности коробок
    public IEnumerable<IGrouping<DateTime?, Pallet>> GroupByExpirationDate()
    {
        return Pallets.GroupBy(p => p.ExpirationDate)
                      .OrderBy(g => g.Key);
    }

    // Получение 3 паллет с наибольшим сроком годности коробок
    public IEnumerable<Pallet> GetTop3ByLongestExpiration()
    {
        return Pallets
            .OrderByDescending(p => p.ExpirationDate) 
            .Take(3)                                  
            .OrderBy(p => p.Volume);           
    }
}
