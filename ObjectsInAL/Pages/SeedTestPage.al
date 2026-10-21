page 50460 "Seed Selection Test"
{
    PageType = List;
    SourceTable = "Seed Selection Test";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }

                field("Seed Code"; Rec."Seed Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}