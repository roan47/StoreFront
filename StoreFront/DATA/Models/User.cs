using System;
using System.Collections.Generic;

namespace DATA.Models
{
    public partial class User
    {
        public User()
        {
            Orders = new HashSet<Order>();
        }

        public int UserId { get; set; }
        public int? EmployeeId { get; set; }
        public string? UserType { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
