page 50463 "Seed Card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seed Master";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Seed Code"; Rec."Seed Code")
                {

                }

                field("Seed Name"; Rec."Seed Name")
                {

                }

                field(Status; Rec.Status)
                {

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