using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace fmsc.Model
{
    public class GroupedDonation
    {
        public double amount;
        public string country;

        public GroupedDonation(double amount, string country)
        {
            this.amount = amount;
            this.country = country;
        }
    }
}