using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;

namespace WarehouseTests
{
    [TestClass]
    public class WarehouseTests
    {
        [TestMethod]
        public void GetTop3ByLongestExpiration_ShouldReturnThreePalletsSortedByVolume()
        {
            var warehouse = new Warehouse();

            var pallet1 = new Pallet("P1", 100, 100, 100); 
            var pallet2 = new Pallet("P2", 120, 120, 120); 
            var pallet3 = new Pallet("P3", 110, 110, 110); 
            var pallet4 = new Pallet("P4", 130, 130, 130); 

            pallet1.Boxes.Add(new Box("B1", 10, 10, 10, 5, DateTime.Now.AddDays(90))); 
            pallet2.Boxes.Add(new Box("B2", 10, 10, 10, 5, DateTime.Now.AddDays(80))); 
            pallet3.Boxes.Add(new Box("B3", 10, 10, 10, 5, DateTime.Now.AddDays(100)));
            pallet4.Boxes.Add(new Box("B4", 10, 10, 10, 5, DateTime.Now.AddDays(50))); 

            warehouse.AddPallet(pallet1);
            warehouse.AddPallet(pallet2);
            warehouse.AddPallet(pallet3);
            warehouse.AddPallet(pallet4);

            var result = warehouse.GetTop3ByLongestExpiration().ToList();

            Assert.AreEqual(3, result.Count);
            Assert.AreEqual("P1", result[0].ID);  
            Assert.AreEqual("P3", result[1].ID);  
            Assert.AreEqual("P2", result[2].ID);  
        }

        [TestMethod]
        public void GroupByExpirationDate_ShouldGroupPalletsCorrectly()
        {
            var warehouse = new Warehouse();

            var pallet1 = new Pallet("P1", 100, 100, 100);
            var pallet2 = new Pallet("P2", 100, 100, 100);

            pallet1.Boxes.Add(new Box("B1", 10, 10, 10, 5, DateTime.Now.AddDays(90)));
            pallet2.Boxes.Add(new Box("B2", 10, 10, 10, 5, DateTime.Now.AddDays(80)));

            warehouse.AddPallet(pallet1);
            warehouse.AddPallet(pallet2);

            var groups = warehouse.GroupByExpirationDate().ToList();

            Assert.AreEqual(2, groups.Count); 
            Assert.AreEqual(pallet2.ExpirationDate, groups[0].Key); 
            Assert.AreEqual(pallet1.ExpirationDate, groups[1].Key); 
        }
    }

    [TestClass]
    public class PalletTests
    {
        [TestMethod]
        public void Volume_ShouldCalculateCorrectly()
        {
            var pallet = new Pallet("P1", 100, 100, 100); 
            pallet.Boxes.Add(new Box("B1", 10, 10, 10, 5, DateTime.Now.AddDays(90))); 
            pallet.Boxes.Add(new Box("B2", 5, 5, 5, 5, DateTime.Now.AddDays(90)));  

            var totalVolume = pallet.Volume;

            Assert.AreEqual(1000000 + 1000 + 125, totalVolume); 
        }
    }


}
