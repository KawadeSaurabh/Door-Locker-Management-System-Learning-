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
}