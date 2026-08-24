page 50451 "Door Locker Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Door Locker Master";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Locker Code"; Rec."Locker Code")
                {
                    ApplicationArea = All;
                }
                field("Locker Name"; Rec."Locker Name")
                {
                    ApplicationArea = All;
                }
                field("Locker Type"; Rec."Locker Type")
                {
                    ApplicationArea = All;
                }
                field(Material; Rec.Material)
                {
                    ApplicationArea = All;
                }
                field(Size; Rec.Size)
                {
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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
            action("Test Locker")
            {
                ApplicationArea = All;
                Caption = 'Test Locker';
                trigger OnAction()
                var
                    LockerRec: Record "Door Locker Master";
                begin
                    // 1. Get()
                    LockerRec.Get(Rec."Locker Code");

                    Message('GET() Result:\Locker Code: %1\Locker Name: %2',
                    LockerRec."Locker Code",
                    LockerRec."Locker Name");

                    // 2. Reset the variable
                    LockerRec.Reset();

                    // 3. FindFirst()
                    if LockerRec.FindFirst() then
                        Message('FINDFIRST() Result:\Locker Code: %1\Locker Name: %2',
                        LockerRec."Locker Code",
                        LockerRec."Locker Name");

                    // 4. Apply a filter
                    LockerRec.SetRange(Status, LockerRec.Status::Available);

                    // 5. Find the first record matching the filter\
                    if LockerRec.FindFirst() then
                        Message('SETRANGE() + FINDFIRST() Result:\Locker Code: %1\Locker Name: %2',
                        LockerRec."Locker Code",
                        LockerRec."Locker Name");

                    // 6. Remove the filter
                    LockerRec.Reset();

                    Message('RESET() executed. All filters are removed.');
                end;
            }

            action(TestRecordVariable)
            {
                ApplicationArea = All;
                Caption = 'Test Record Variable';
            }
        }
    }
}