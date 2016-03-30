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
        private double v;
        private DateTime dateTime;

        public Donation(string userId, double amount, DateTime date)
        {
            this.userId = userId;
            this.amount = amount;
            this.date = date;
        }

        public Donation(double amount, DateTime dateTime)
        {
            this.amount = amount;
            this.dateTime = dateTime;
        }
    }
}