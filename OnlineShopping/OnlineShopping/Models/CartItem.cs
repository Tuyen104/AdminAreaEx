using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShopping.Models
{
    public class CartItem
    {
        //trùng tên với bên new_items trong shopping.js, addnewitem
        public int productid { get; set; }
        public string unit { get; set; }
        public decimal price { get; set; }
        public decimal quantity { get; set; }
    }
}