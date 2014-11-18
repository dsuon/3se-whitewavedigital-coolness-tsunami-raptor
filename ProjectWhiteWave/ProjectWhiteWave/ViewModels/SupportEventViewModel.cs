using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectWhiteWave.Models;

namespace ProjectWhiteWave.ViewModels
{
    public class SupportEventViewModel
    {
        public SupportEvent SupportEvent { get; set; }
        public IEnumerable<SelectListItem> AllEmployees { get; set; }

        private List<int> selectedEmployees;
        public List<int> SelectedEmployees
        {
            get 
            {
                if (selectedEmployees == null)
                {
                    selectedEmployees = SupportEvent
                        .Employees
                        .Select(m => m.Id)
                        .ToList();
                }
                return selectedEmployees;
            }
            set { selectedEmployees = value; }
        }
    }
}