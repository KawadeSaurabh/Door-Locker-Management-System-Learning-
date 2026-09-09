table 50450 "Door Locker Master"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Locker Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Locker Name"; Text[100])
        {
            NotBlank = true;
        }
        field(3; "Locker Type"; Option)
        {
            OptionMembers = Home,Office,Fireproof,Industrial;
        }
        field(4; Material; Option)
        {
            OptionMembers = Steel,Alloy,Iron,Other;
        }
        field(5; "Size"; Text[30])
        {

        }
        field(6; Price; Decimal)
        {
            trigger OnValidate()
            begin
                if Price < 0 then
                    Error('Price cannot be less than 0');
            end;
        }
        field(7; "Available Quantity"; Integer)
        {
            trigger OnValidate()
            begin
                if "Available Quantity" < 0 then
                    Error('Available quantity cannot be negative');

                UpdateStatus();
            end;
        }

        field(8; Status; Option)
        {
            OptionMembers = Available,"Out Of Stock";
        }

    }

    keys
    {
        key(Pk; "Locker Code")
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    begin
        if Rec."Locker Code" <> xRec."Locker Code"
        then
            Error('Locker Code cannot be changed.');
    end;

    procedure UpdateStatus()
    begin
        if "Available Quantity" = 0 then
            Status := Status::"Out Of Stock"
        else
            Status := Status::Available;
    end;

    procedure ApplyDiscount()
    begin
        Rec.Price := Rec.Price - (Rec.Price * 0.10);
    end;


    procedure ShowAvailableLockers()
    var
        LockerRec: Record "Door Locker Master";
    begin
        LockerRec.SetRange(Status, LockerRec.Status::Available);

        if LockerRec.FindSet() then
            repeat
                Message('%1 -%2',
                LockerRec."Locker Code",
                LockerRec."Locker Name");
            until LockerRec.Next() = 0;
    end;

    procedure TestNext()
    var
        LockerRec: Record "Door Locker Master";
    begin
        if LockerRec.FindSet() then
            Message('%1 - %2',
            LockerRec."Locker Code",
            LockerRec."Locker Name");

        LockerRec.Next();

        Message('%1 - %2',
            LockerRec."Locker Code",
            LockerRec."Locker Name");

        LockerRec.Next();

        Message('%1 - %2',
           LockerRec."Locker Code",
           LockerRec."Locker Name");
    end;

    procedure TestFindLast()
    var
        LockerRec: Record "Door Locker Master";
    begin
        LockerRec.SetRange(Status, LockerRec.Status::Available);

        if LockerRec.FindLast() then
            Message('%1 - %2',
            LockerRec."Locker Code",
            LockerRec."Locker Name");

    end;

    procedure TestFind()
    var
        LockerRec: Record "Door Locker Master";
    begin

        if LockerRec.Find('-') then
            Message('%1 - %2',
            LockerRec."Locker Code",
            LockerRec."Locker Name");

        if LockerRec.Find('+') then
            Message('%1 - %2',
            LockerRec."Locker Code",
            LockerRec."Locker Name");
    end;

    procedure RecordBufferConcept()
    var
        LockerRec: Record "Door Locker Master";
    begin
        if LockerRec.FindFirst() then
            Message('%1 - %2',
            LockerRec."Locker Code",
            LockerRec."Locker Name");

        if LockerRec.FindLast() then
            Message('%1 - %2',
            LockerRec."Locker Code",
            LockerRec."Locker Name");
    end;

    procedure TestIsEmpty()
    var
        LockerRec: Record "Door Locker Master";
    begin
        LockerRec.SetRange(Status, LockerRec.Status::"Out Of Stock");

        if LockerRec.IsEmpty() then
            Message('No out of stock lockers found.')
        else
            Message('Out of stock lockers exist.');
    end;

    procedure TestCount()
    var
        LockerRec: Record "Door Locker Master";
        AvailableCount: Integer;
    begin
        LockerRec.SetRange(Status, LockerRec.Status::Available);

        AvailableCount := LockerRec.Count();

        Message('Available lockers: %1', AvailableCount);
    end;

    procedure TestSetRange()
    var
        LockerRec: Record "Door Locker Master";
    begin
        LockerRec.SetRange(Price, 5000, 10000);

        if LockerRec.FindSet() then
            repeat
                Message('%1 - %2',
                LockerRec."Locker Code",
                LockerRec.Price);
            until LockerRec.Next() = 0;
    end;

    procedure TestSetFilter()
    var
        LocRec: Record "Door Locker Master";
    begin
        LocRec.SetFilter(Price, '>5000');

        if LocRec.FindSet() then
            repeat
                Message('%1 - %2',
                LocRec."Locker Code",
                LocRec.Price);
            until LocRec.Next() = 0;
    end;

    procedure TestGetRange()
    var
        LocRec: Record "Door Locker Master";

        MinValue: Integer;

        MaxValue: Integer;
    begin
        LocRec.SetRange(Price, 5000, 15000);

        MinValue := LocRec.GetRangeMin(Price);
        MaxValue := LocRec.GetRangeMax(Price);

        Message('MinValue - %1 And MaxValue - %2', MinValue, MaxValue);
    end;
}