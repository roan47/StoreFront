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

        public string UserId { get; set; } = null!;
        public int? EmployeeId { get; set; }
        public string? UserType { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string Adress { get; set; } = null!;
        public string City { get; set; } = null!;
        public string State { get; set; } = null!;
        public string Country { get; set; } = null!;
        public string? Zip { get; set; }
        public string? Phone { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
