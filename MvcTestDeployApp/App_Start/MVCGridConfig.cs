[assembly: WebActivatorEx.PreApplicationStartMethod(typeof(MvcTestDeployApp.MVCGridConfig), "RegisterGrids")]

namespace MvcTestDeployApp
{
    using System;
    using System.Web;
    using System.Web.Mvc;
    using System.Linq;
    using System.Collections.Generic;
    using MvcTestDeployApp.Models;
    using MVCGrid.Models;
    using MVCGrid.Web;

    public static class MVCGridConfig 
    {
        public static void RegisterGrids()
        {
            ColumnDefaults colDefauls = new ColumnDefaults()
            {
                EnableSorting = true
            };

            MVCGridDefinitionTable.Add("EmployeeGrid", new MVCGridBuilder<Employee>(colDefauls)
                .WithAuthorizationType(AuthorizationType.AllowAnonymous)
                .WithSorting(sorting: true, defaultSortColumn: "Id", defaultSortDirection: SortDirection.Dsc)
                .WithPaging(paging: true, itemsPerPage: 10, allowChangePageSize: true, maxItemsPerPage: 100)
                .WithAdditionalQueryOptionNames("search")
                .AddColumns(cols =>
                {
                    cols.Add("Id").WithValueExpression(p => p.EmployeeId.ToString());
                    cols.Add("FirstName").WithHeaderText("First Name")
                    .WithVisibility(true, true)
                    .WithValueExpression(p => p.FirstName);
                    cols.Add("LastName").WithHeaderText("Last Name")
                    .WithVisibility(true, true)
                    .WithValueExpression(p => p.LastName);
                    cols.Add("FullName").WithHeaderText("Full Name")
                        .WithValueTemplate("{Model.FirstName} {Model.LastName}")
                        .WithVisibility(visible: false, allowChangeVisibility: true)
                        .WithSorting(false);
                    cols.Add("StartDate").WithHeaderText("Start Date")
                        .WithVisibility(visible: true, allowChangeVisibility: true)
                        .WithValueExpression(p => p.StartDate.HasValue ? p.StartDate.Value.ToShortDateString() : "");
                    cols.Add("Status")
                        .WithSortColumnData("Active")
                        .WithVisibility(visible: true, allowChangeVisibility: true)
                        .WithHeaderText("Status")
                        .WithSorting(false)
                        .WithValueExpression(p => p.Status);
                    cols.Add("Gender").WithValueExpression((p, c) => p.Gender)
                        .WithAllowChangeVisibility(true);
                    cols.Add("Email")
                        .WithVisibility(visible: false, allowChangeVisibility: true)
                        .WithValueExpression(p => p.Email);
                }
            )
            .WithRetrieveDataMethod((context) =>
            {
                var options = context.QueryOptions;
                int totalRecords;
                string globalSearch = options.GetAdditionalQueryOptionString("search");
                string sortColumn = options.GetSortColumnData<string>();

                var items = GetData(out totalRecords, globalSearch, null, null, null, options.GetLimitOffset(), 
                    options.GetLimitRowcount(), sortColumn, options.SortDirection == SortDirection.Dsc);                  

                return new QueryResult<Employee>()
                {
                    Items = items,
                    TotalRecords = totalRecords
                };
            })
        );
        }

        public static List<Employee> GetData(out int totalRecords, string globalSearch, string filterFirstName, string filterLastName, bool? filterActive, int? limitOffset, int? limitRowCount, string orderBy, bool desc)
        {
            using (var db = new MvcTestDeployAppContext())
            {
                var query = db.Employees.AsQueryable();

                if (!String.IsNullOrWhiteSpace(filterFirstName))
                {
                    query = query.Where(p => p.FirstName.Contains(filterFirstName));
                }
                if (!String.IsNullOrWhiteSpace(filterLastName))
                {
                    query = query.Where(p => p.LastName.Contains(filterLastName));
                }
                //if (filterActive.HasValue)
                //{
                //    query = query.Where(p => p.Status == filterActive.Value);
                //}

                if (!String.IsNullOrWhiteSpace(globalSearch))
                {
                    query = query.Where(p => (p.FirstName + " " + p.LastName).Contains(globalSearch));
                }

                totalRecords = query.Count();

                if (!String.IsNullOrWhiteSpace(orderBy))
                {
                    switch (orderBy.ToLower())
                    {
                        case "firstname":
                            if (!desc)
                                query = query.OrderBy(p => p.FirstName);
                            else
                                query = query.OrderByDescending(p => p.FirstName);
                            break;
                        case "lastname":
                            if (!desc)
                                query = query.OrderBy(p => p.LastName);
                            else
                                query = query.OrderByDescending(p => p.LastName);
                            break;
                        case "active":
                            //if (!desc)
                            //    query = query.OrderBy(p => p.Active);
                            //else
                            //    query = query.OrderByDescending(p => p.Active);
                            break;
                        case "email":
                            if (!desc)
                                query = query.OrderBy(p => p.Email);
                            else
                                query = query.OrderByDescending(p => p.Email);
                            break;
                        case "gender":
                            if (!desc)
                                query = query.OrderBy(p => p.Gender);
                            else
                                query = query.OrderByDescending(p => p.Gender);
                            break;
                        case "id":
                            if (!desc)
                                query = query.OrderBy(p => p.EmployeeId);
                            else
                                query = query.OrderByDescending(p => p.EmployeeId);
                            break;
                        case "startdate":
                            if (!desc)
                                query = query.OrderBy(p => p.StartDate);
                            else
                                query = query.OrderByDescending(p => p.StartDate);
                            break;
                    }
                }


                if (limitOffset.HasValue)
                {
                    query = query.Skip(limitOffset.Value).Take(limitRowCount.Value);
                }

                return query.ToList();
            }
        }
    }
}