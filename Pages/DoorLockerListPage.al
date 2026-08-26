page 50450 "Door Locker List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Door Locker Master";

    layout
    {
        area(Content)
        {
            repeater(Group)
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
            action(TestFindFirst)
            {
                ApplicationArea = All;
                Caption = 'Test Find First';

                trigger OnAction()
                var
                    LockerRec: Record "Door Locker Master";
                begin
                    if LockerRec.FindFirst() then
                        Message('First Locker: %1', LockerRec."Locker Name")
                    else
                        Message('No lockers found.');
                end;
            }

            action(TestRecord)
            {
                ApplicationArea = All;
                Caption = 'Test Record';

                trigger OnAction()
                var
                    LockerRec: Record "Door Locker Master";
                begin


                    Message(
                    'Current Page Record: %1',
                    Rec."Locker Code");

                    LockerRec.SetRange(Status, LockerRec.Status::Available);

                    if LockerRec.FindFirst() then
                        Message('First available locker: %1\price: %2',
                        LockerRec."Locker Name",
                        LockerRec.Price)
                    else
                        Message('No available lockers found.');
                end;
            }
        }
    }
}