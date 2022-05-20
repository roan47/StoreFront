using System;
using System.Collections.Generic;

namespace DATA.Models
{
    public partial class Supplier
    {
        public Supplier()
        {
            Products = new HashSet<Product>();
        }

        public int SupId { get; set; }
        public string SupName { get; set; } = null!;
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string Country { get; set; } = null!;
        public string? Phone { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
