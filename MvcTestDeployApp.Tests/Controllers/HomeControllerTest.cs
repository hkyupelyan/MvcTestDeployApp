using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MvcTestDeployApp;
using MvcTestDeployApp.Controllers;
using NUnit.Framework;

namespace MvcTestDeployApp.Tests.Controllers
{
    [TestClass]
    [TestFixture]
    public class HomeControllerTest
    {
        [TestMethod]
        [Test]
        public void Index()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            NUnit.Framework.Assert.IsNotNull(result);
        }

        [TestMethod]
        [Test]
        public void About()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.About() as ViewResult;

            // Assert
            NUnit.Framework.Assert.AreEqual("Your application description page.", result.ViewBag.Message);
        }

        [TestMethod]
        [Test]
        public void Contact()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Contact() as ViewResult;

            // Assert
            NUnit.Framework.Assert.IsNotNull(result);
        }
    }
}
