page 50459 "Seed Master"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seed Master";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Seed Code"; Rec."Seed Code")
                {
                    ApplicationArea = All;
                }
                field("Seed Name"; Rec."Seed Name")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("QC Test Count"; Rec."QC Test Count")
                {
                    ApplicationArea = All;
                    // DrillDown = true;
                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(ShowQCTests)
            {
                Caption = 'Show QC Tests';
                ApplicationArea = All;
                Image = View;

                trigger OnAction()
                begin
                    Rec.ShowQCTests();
                end;
            }
        }
    }
}