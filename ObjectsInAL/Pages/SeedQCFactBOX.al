page 50465 "Seed QC FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seed Master";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("QC Test Count"; Rec."QC Test Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}