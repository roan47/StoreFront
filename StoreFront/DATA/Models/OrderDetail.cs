using System;
using System.Collections.Generic;

namespace DATA.Models
{
    public partial class OrderDetail
    {
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public short Quantity { get; set; }
        public decimal? Pprice { get; set; }

        public virtual Product Product { get; set; } = null!;
        public virtual Order Order { get; set; } = null!;
    }
}
