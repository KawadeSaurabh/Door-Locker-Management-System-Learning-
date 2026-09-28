page 50458 "Door Loc Archive Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Door Loc Archive T";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(LockerCode; Rec.LockerCode)
                {
                    ApplicationArea = All;
                }
                field(LockerName; Rec.LockerName)
                {
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field(AvailableQty; Rec.AvailableQty)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field(ArchiveDate; Rec.ArchiveDate)
                {
                    ApplicationArea = All;
                }
                field(Rate; Rec.Rate)
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
            action(TransferField)
            {
                Caption = 'Transfer Field Archive';
                trigger OnAction()
                begin
                    Rec.ArchiveTestLocker();
                end;
            }
        }
    }
}