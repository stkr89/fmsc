using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace fmsc.Model
{
    public class Donation
    {
        public int id;
        public string userId;
        public double amount;
        public DateTime date;

        public Donation(int id, string userId, double amount, DateTime date)
        {
            this.id = id;
            this.userId = userId;
            this.amount = amount;
            this.date = date;
        }
    }
}