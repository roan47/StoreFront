﻿using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DATA.Models
{
    #region Categories

    [ModelMetadataType(typeof(CategoryMetadata))]

    public partial class Category { }


    #endregion
    #region Orders
    [ModelMetadataType(typeof(OrderMetadata))]
    public partial class Order { }

    #endregion


    #region Products
    [ModelMetadataType(typeof(ProductMetadata))]

    public partial class Product { }
    #endregion

    #region Supplier
    [ModelMetadataType(typeof(SupplierMetadata))]
    public partial class Supplier { }

    #endregion

    #region UserDetails
    [ModelMetadataType(typeof(UserMetadata))]

    public partial class UserDetails { }
    #endregion




}


