using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcTestDeployApp.Models;

namespace MvcTestDeployApp.ViewModel
{
    public class EmployeeMVCGridToolbarModelViewModel
    {
        public MVCGridToolbarModel MVCGridToolbarModel { get; set; }
        public List<Employee> Employees { get; set; }
    }
}