
page 50461 "Seed QC Test List"
{
    Caption = 'Seed QC Test List';
    PageType = List;
    SourceTable = "Seed QC Test";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Test No."; Rec."Test No.")
                {
                    ApplicationArea = All;
                }
                field("Seed Code"; Rec."Seed Code")
                {
                    ApplicationArea = All;
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = All;
                }
                field("Test Date"; Rec."Test Date")
                {
                    ApplicationArea = All;
                }
                field("QC Status"; Rec."QC Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
