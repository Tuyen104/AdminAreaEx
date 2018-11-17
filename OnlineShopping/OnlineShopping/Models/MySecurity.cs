using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace OnlineShopping.Models
{
    public class MySecurity
    {
        public static string EncryptPass(string pass)
        {
            SHA256 sha = SHA256.Create();
            byte[] rs = sha.ComputeHash(Encoding.UTF8.GetBytes(pass));
            return BitConverter.ToString(rs).Replace("-", "").ToLower();
        }
    }
}