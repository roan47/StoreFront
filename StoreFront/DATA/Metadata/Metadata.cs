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
        public string? CategoryDescription { get; set; }

    }
    #endregion

    #region Order

    public class OrderMetadata
    {
        //nothing needed-this is a PK
        public int OrderId { get; set; }

        //no metadata needed for FKs - as they are represented in a View by a dropdown list
        public string UserId { get; set; } = null!;
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        [Display(Name = "Oder Date")]
        [Required]
        public DateTime OrderDate { get; set; }

        [StringLength(100)]
        [Display(Name = "Ship to")]
        [Required]

        public string ShipToName { get; set; } = null!;
        [StringLength(50)]
        [Display(Name = "City")]
        [Required]
        public string ShipCity { get; set; } = null!;

        [StringLength(2)]
        [Display(Name = "State")]
        [Required]
        public string? ShipState { get; set; }

        [StringLength(5)]
        [Display(Name = "Zip")]
        [DataType(DataType.PostalCode)]
        [Required]
        public string ShipZip { get; set; } = null!;
    }
    #endregion
    #region Product
    public class ProductMetadata
    {

        public int ProductId { get; set; }


        [Required(ErrorMessage = "* Product Name is required")]
        [StringLength(200)]
        [Display(Name = "Product")]
        public string ProductName { get; set; } = null!;

        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:c}")]
        [Display(Name = "Price")]
        [Range(0, double.MaxValue)]
        [Required]

        public decimal ProductPrice { get; set; }

        [StringLength(500)]
        public string? ProductDescription { get; set; }

        [Required]
        [Range(0, short.MaxValue)]
        [Display(Name = "In Stock")]
        public short UnitsInStock { get; set; }
        [Required]
        [Range(0, short.MaxValue)]
        [Display(Name = "On Order")]
        public short UnitsOnOrder { get; set; }

        public bool IsDiscontinued { get; set; }
        public int CategoryId { get; set; }
        public int? SupplierId { get; set; }
        public string? ProductImage { get; set; }


    }
    #endregion

    #region Supplier
    public class SupplierMetadata
    {
        public int SupplierId { get; set; }

        [Required(ErrorMessage = "* Supplier Name is required")]
        [StringLength(100)]
        [Display(Name = "Supplier")]
        public string SupplierName { get; set; } = null!;
        [StringLength(150)]

        public string Address { get; set; } = null!;
        [StringLength(100)]
        public string City { get; set; } = null!;
        [StringLength(2)]
        public string? State { get; set; }

        [StringLength(5)]
        [Display(Name = "Zip")]
        [DataType(DataType.PostalCode)]
        [Required]
        public string? Zip { get; set; }
        [StringLength(24)]
        public string? Phone { get; set; }
    }
    #endregion

    #region UserDetail
    public class UserMetadata
    {
        public string UserId { get; set; } = null!;
        [Required(ErrorMessage = "*  Name is required")]
        [StringLength(100)]
        [Display(Name = "FirstName")]
        public string FirstName { get; set; } = null!;
        [Required(ErrorMessage = "*  Name is required")]
        [StringLength(100)]
        [Display(Name = "LastName")]
        public string LastName { get; set; } = null!;
        [StringLength(150)]
        public string? Address { get; set; }
        [StringLength(100)]
        public string? City { get; set; }
        [StringLength(2)]
        public string? State { get; set; }
        [StringLength(5)]
        [Display(Name = "Zip")]
        [DataType(DataType.PostalCode)]
        [Required]
        public string? Zip { get; set; }
        [StringLength(24)]
        public string? Phone { get; set; }

    }

    #endregion
}
