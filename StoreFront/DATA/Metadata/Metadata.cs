using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATA.Models
{
    #region Category
    public class CategoryMetadata
    {
        public int CategoryId { get; set; }

        [Required(ErrorMessage = "* Category Name is required")]
        [StringLength(50)]
        [Display(Name = "Category")]
        public string CategoryName { get; set; } = null!;
        [StringLength(500)]
        public string? CategoryDescript{ get; set; }

    }
    #endregion

    #region Order

    public class OrderMetadata
    {
        public int OrderId { get; set; }


        public int UserId { get; set; }
        [StringLength(50)]
        public string Address { get; set; } = null!;
       [StringLength(50)]
        public string City { get; set; } = null!;
        [StringLength (50)]
        public string State { get; set; } = null!;
        [StringLength(50)]
        public string Country { get; set; } = null!;
        [StringLength(10)]
        [Display(Name = "Zip")]
        [DataType(DataType.PostalCode)]
        [Required]
        public string Zip { get; set; } = null!;

        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:c}")]
        [Display(Name = "Price")]
        [Range(0, double.MaxValue)]
        [Required]
        public decimal Price { get; set; }
        public int Quantity { get; set; }
    }
    #endregion
    #region Product
    public class ProductMetadata
    {

        public int ProductId { get; set; }
        [Required(ErrorMessage = "* Product Name is required")]
        [StringLength(200)]
        [Display(Name = "Product")]
        public string Pname { get; set; } = null!;
        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:c}")]
        [Display(Name = "Price")]
        [Range(0, double.MaxValue)]
        [Required]
        public decimal Pprice { get; set; }

        [StringLength(500)]
        public string? Pdescript { get; set; }
        [Required]
        [Range(0, short.MaxValue)]
        [Display(Name = "In Stock")]
        public short InStock { get; set; }

        public short OutStock { get; set; }
        public int CategoryId { get; set; }
        public int SupplierId { get; set; }
        [StringLength(75)]
        [Display(Name = "Image")]
        public string? Img { get; set; }

    }
    #endregion

    #region Supplier
    public class SupplierMetadata
    {
        public int SupId { get; set; }
        [Required(ErrorMessage = "* Supplier Name is required")]
        [StringLength(100)]
        [Display(Name = "Supplier")]
        public string SupName { get; set; } = null!;

        [StringLength(50)]
        public string? Address { get; set; }
        [StringLength(10)]

        public string? City { get; set; }
        [StringLength(5)]
        public string? State { get; set; }
        [StringLength(50)]
        public string Country { get; set; } = null!;
        [StringLength(10)]
        public string? Phone { get; set; }
    }
    #endregion

    #region UserDetail
    public class UserMetadata
    {
        public int UserId { get; set; }
        public int? EmployeeId { get; set; }
       [StringLength(50)]
        public string? UserType { get; set; }
        [StringLength(50)]
        public string FirstName { get; set; } = null!;
        [StringLength(50)]
        public string LastName { get; set; } = null!;
        [StringLength(50)]
        public string Adress { get; set; } = null!;
        [StringLength(50)]
        public string City { get; set; } = null!;
        [StringLength(2)]
        public string State { get; set; } = null!;
        [StringLength(50)]
        public string Country { get; set; } = null!; 
        [StringLength(10)]
        public string? Zip { get; set; }
        [StringLength(10)]
        public string? Phone { get; set; }


    }

    #endregion
}
