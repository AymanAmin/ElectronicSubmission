﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ElectronicSubmission
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class REU_RegistrationEntities : DbContext
    {
        public REU_RegistrationEntities()
            : base("name=REU_RegistrationEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Collage> Collages { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<File> Files { get; set; }
        public DbSet<Group> Groups { get; set; }
        public DbSet<Group_Status> Group_Status { get; set; }
        public DbSet<LanguageMaster> LanguageMasters { get; set; }
        public DbSet<Lanuage_Detials> Lanuage_Detials { get; set; }
        public DbSet<Log_File> Log_File { get; set; }
        public DbSet<Nationality> Nationalities { get; set; }
        public DbSet<Notification_Employee> Notification_Employee { get; set; }
        public DbSet<Notification_Master> Notification_Master { get; set; }
        public DbSet<Notification_Show> Notification_Show { get; set; }
        public DbSet<Payment_Process> Payment_Process { get; set; }
        public DbSet<Payment_Type> Payment_Type { get; set; }
        public DbSet<Permission> Permissions { get; set; }
        public DbSet<Permission_Group> Permission_Group { get; set; }
        public DbSet<Resource> Resources { get; set; }
        public DbSet<Sequence> Sequences { get; set; }
        public DbSet<Specialization> Specializations { get; set; }
        public DbSet<Status> Status { get; set; }
        public DbSet<Student> Students { get; set; }
    }
}
