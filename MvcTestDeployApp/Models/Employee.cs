using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcTestDeployApp.Models
{
    public class Employee
    {
        [DisplayName("Id")]
        public long EmployeeId { get; set; }
        [DisplayName("First Name")]
        public string FirstName { get; set; }
        [DisplayName("Last Name")]
        public string LastName { get; set; }
        [DisplayName("Full Name")]
        public string FullName { get; set; }
        [DisplayName("Start Date")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? StartDate { get; set; }
        public string Status { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
    }
}