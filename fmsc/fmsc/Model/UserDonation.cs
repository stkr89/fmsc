using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace fmsc.Model
{
    public class UserDonation
    {
        public Donation donation;
        public User user;

        public UserDonation(Donation donation, User user)
        {
            this.donation = donation;
            this.user = user;
        }
    }
}