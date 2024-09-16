using System;
using System.Collections.Generic;
using System.Data.SqlClient;

public class DataService
{
    private string _connectionString = "Server=DESKTOP-NNHQ8UF\\SQLEXPRESS02;Database=WarehouseDB;Integrated Security=True;";

    public List<Pallet> GetPallets()
    {
        var pallets = new List<Pallet>();

        using (var connection = new SqlConnection(_connectionString))
        {
            connection.Open();

            var command = connection.CreateCommand();
            command.CommandText = "SELECT PalletId, Width, Height, Depth FROM Pallets";

            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    var pallet = new Pallet(
                        reader.GetString(0),  
                        reader.GetDouble(1),  
                        reader.GetDouble(2),  
                        reader.GetDouble(3)); 

                    pallets.Add(pallet);
                }
            }

            foreach (var pallet in pallets)
            {
                pallet.Boxes = GetBoxesForPallet(pallet.ID, connection);
            }
        }

        return pallets;
    }

    private List<Box> GetBoxesForPallet(string palletId, SqlConnection connection)
    {
        var boxes = new List<Box>();

        using (var command = connection.CreateCommand())
        {
            command.CommandText = "SELECT BoxId, Width, Height, Depth, Weight, ExpirationDate, ProductionDate FROM Boxes WHERE PalletId = @PalletId";
            command.Parameters.AddWithValue("@PalletId", palletId);

            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    var box = new Box(
                        reader.GetString(0), 
                        reader.GetDouble(1),  
                        reader.GetDouble(2),  
                        reader.GetDouble(3),  
                        reader.GetDouble(4),  
                        reader.IsDBNull(5) ? (DateTime?)null : reader.GetDateTime(5),  
                        reader.IsDBNull(6) ? (DateTime?)null : reader.GetDateTime(6)); 

                    boxes.Add(box);
                }
            }
        }

        return boxes;
    }
}
