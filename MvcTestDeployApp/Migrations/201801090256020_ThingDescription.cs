namespace MvcTestDeployApp.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ThingDescription : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Things", "Description", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Things", "Description");
        }
    }
}
