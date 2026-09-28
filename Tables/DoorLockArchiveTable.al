table 50455 "Door Loc Archive T"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; LockerCode; Code[20])
        {
            NotBlank = true;
        }

        field(2; LockerName; Text[100])
        {
            NotBlank = true;
        }

        field(3; Price; Decimal)
        {
            NotBlank = true;
        }

        field(4; AvailableQty; Integer)
        {
            NotBlank = true;
        }
        field(5; Status; Option)
        {
            OptionMembers = Available,"Out Of Stock";
        }

        field(6; Rate; Integer)
        {
            NotBlank = true;
        }
        field(7; ArchiveDate; Date)
        {
            NotBlank = true;
        }

    }

    keys
    {
        key(PK; LockerCode)
        {
            Clustered = true;
        }
    }

    procedure ArchiveTestLocker()
    var
        LockerRec: Record "Door Loc Master T";
        ArchiveRec: Record "Door Loc Archive T";
    begin
        if LockerRec.Get('L101') then begin
            ArchiveRec.TransferFields(LockerRec);
            ArchiveRec.ArchiveDate := Today();
            ArchiveRec.Insert();
        end;
    end;
}