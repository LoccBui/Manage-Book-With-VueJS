using QuanLySach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace QuanLySach.Controllers
{
    public class UserController : ApiController
    {
        QLSachEntities db = new QLSachEntities();

        public IEnumerable<Users> Get()
        {
            return db.Users.ToList();

        }


        //Get By Id
        [Route("user/{name}/{password}")]
        [HttpGet]
        public IHttpActionResult Login(string name, string password)
        {
            IList<Users> us = null;

      
            byte[] pass = Encoding.ASCII.GetBytes(password);

            using (var ctx = new QLSachEntities())
            {
                us = ctx.Users.Include("Users")
                    .Where(s => s.UserName.ToLower() == name.ToLower() && s.UserPass == pass)
                    .Select(s => new Users()
                    {
                        UserName = s.UserName,
                        UserPass = s.UserPass,
                    }).ToList<Users>();
            }

            if (us == null)
            {
                return NotFound();
            }

            return Ok(us);
        }

    }
}
