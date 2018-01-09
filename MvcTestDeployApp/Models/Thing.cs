using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcTestDeployApp.Models
{
    /// <summary>
    /// just added a comment to see if polling will trigger with commit
    /// 
    /// </summary>
    public class Thing
    {
        public long ThingId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    }
}