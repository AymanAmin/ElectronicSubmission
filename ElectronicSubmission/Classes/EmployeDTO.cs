﻿using System;
using System.Collections.Generic;

namespace ElectronicSubmission
{
    internal class EmployeDTO
    {
        public bool? Employee_Active { get; set; } 
        public string Employee_Email { get; set; }
        public int Employee_Id { get; set; }
        public string Employee_Name_Ar { get; set; }
        public string Employee_Name_En { get; set; }
        public string Employee_Password { get; set; }
        public string Employee_Phone { get; set; }
        public string Employee_Profile { get; set; }
        public int? Group_Id { get; set; }

        public Nullable<int> Language_id { get; set; }
        public Nullable<int> Calendar_id { get; set; }
    }
}