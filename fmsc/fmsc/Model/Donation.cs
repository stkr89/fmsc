using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace fmsc.Model
{
    public class Donation
    {
        public string userId;
        public double amount;
        public DateTime date;
        public string displayName;

        public Donation(string userId, double amount, DateTime date, string displayName)
        {
            this.userId = userId;
            this.amount = amount;
            this.date = date;
            this.displayName = displayName;
        }

        public Donation(double amount, DateTime date, string displayName)
        {
            this.amount = amount;
            this.date = date;
            this.displayName = displayName;
        }
    }
}