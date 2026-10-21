
page 50462 "Seed QC Result List"
{
    Caption = 'Seed QC Result List';
    PageType = List;
    SourceTable = "Seed QC Result";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Result No."; Rec."Result No.")
                {
                    ApplicationArea = All;
                }
                field("Test No."; Rec."Test No.")
                {
                    ApplicationArea = All;
                }
                field("Germination %"; Rec."Germination %")
                {
                    ApplicationArea = All;
                }
                field("Physical Purity %"; Rec."Physical Purity %")
                {
                    ApplicationArea = All;
                }
                field("Moisture %"; Rec."Moisture %")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
