namespace MvcTestDeployApp.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialMigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Things",
                c => new
                    {
                        ThingId = c.Long(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.ThingId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Things");
        }
    }
}
