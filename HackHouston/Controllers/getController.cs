using System;
using System.Collections.Generic;
//using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
//using System.ServiceModel.Channels;
using System.Web.Http;
using HackHouston.Services;

namespace HackHouston.Controllers
{
    public class getController : ApiController
    {
        private JsonRepository jsonRepository;

        public getController()
        {
            this.jsonRepository = new JsonRepository();
        }

        [HttpGet]
        public HttpResponseMessage all()
        {
            return jsonRepository.GetAllJsons(null, null);
        }

        [HttpGet]
        public HttpResponseMessage all(string hash, string callback)
        {
            return jsonRepository.GetAllJsons(hash, callback);
        }

        [HttpGet]
        public HttpResponseMessage all(string callback)
        {
            return jsonRepository.GetAllJsons(null, callback);
        }
    }
}
