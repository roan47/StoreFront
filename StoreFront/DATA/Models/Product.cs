using System;
using System.Collections.Generic;

namespace DATA.Models
{
    public partial class Product
    {
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int ProductId { get; set; }
        public string Pname { get; set; } = null!;
        public decimal Pprice { get; set; }
        public string? Pdescript { get; set; }
        public short InStock { get; set; }
        public short OutStock { get; set; }
        public int CategoryId { get; set; }
        public int SupplierId { get; set; }
        public string? Img { get; set; }

        public virtual Category Category { get; set; } = null!;
        public virtual Supplier Supplier { get; set; } = null!;
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
