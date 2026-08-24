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
}