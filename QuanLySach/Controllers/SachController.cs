using QuanLySach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QuanLySach.Controllers
{
    public class SachController : ApiController
    {
        QLSachEntities db = new QLSachEntities();


        //Post request
        public String Post(Sach sach)
        {
            db.Sach.Add(sach);
            db.SaveChanges();
            return "Book Added";
        }

        public IEnumerable<Sach> Get()
        {
            return db.Sach.ToList();
        }
    }
}
