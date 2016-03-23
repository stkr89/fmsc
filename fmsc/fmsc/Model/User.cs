﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace fmsc.Model
{
    public class User
    {
        string firstName;
        string lastName;
        string email;
        string password;
        string mobile;
        string address1;
        string address2;
        string country;
        string state;
        string city;
        string zip;

        public User(string firstName, string lastName, string email, string password, string mobile, string address1, string address2, 
            string country, string state, string city, string zip)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.email = email;
            this.password = password;
            this.mobile = mobile;
            this.address1 = address1;
            this.address2 = address2;
            this.country = country;
            this.state = state;
            this.city = city;
            this.zip = zip;
        }

    }
}