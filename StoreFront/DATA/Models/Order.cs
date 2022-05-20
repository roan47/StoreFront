﻿using System;
using System.Collections.Generic;

namespace DATA.Models
{
    public partial class Order
    {
        public int OrderId { get; set; }
        public int UserId { get; set; }
        public string Address { get; set; } = null!;
        public string City { get; set; } = null!;
        public string State { get; set; } = null!;
        public string Country { get; set; } = null!;
        public string Zip { get; set; } = null!;
        public decimal Price { get; set; }
        public int Quantity { get; set; }

        public virtual OrderDetail OrderNavigation { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
