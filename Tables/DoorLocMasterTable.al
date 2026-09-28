table 50454 "Door Loc Master T"
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

        field(6; Ratings; Integer)
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

    procedure TestLockerAvailability()
    var
        LockerRec: Record "Door Loc Master T";
    begin
        if LockerRec.Get(Rec.LockerCode) then begin
            LockerRec.TestField(Status, LockerRec.Status::Available);
            Message('Locker is available.');
        end;
    end;

    procedure TestFieldError()
    var
        LockerRec: Record "Door Loc Master T";
    begin
        if LockerRec.Get(Rec.LockerCode) then begin
            if LockerRec.AvailableQty <= 0 then
                LockerRec.FieldError("AvailableQty");
        end;
    end;

    procedure SellLocker()
    var
        LockerRec: Record "Door Loc Master T";
    begin
        if LockerRec.Get(Rec.LockerCode) then begin
            LockerRec.TestField(Status, LockerRec.Status::Available);

            if LockerRec.AvailableQty > 0 then begin
                LockerRec.AvailableQty := LockerRec.AvailableQty - 1;
                LockerRec.Modify();
                Message('Locker Sold Successfully.');
            end
            else begin
                LockerRec.FieldError("AvailableQty");
            end;


        end;
    end;

    procedure ShowLockerMessage()
    begin
        Message('This is my first procedure.');
    end;

    procedure TestProcedure()
    begin
        ShowLockerMessage();
        SHowLockerDetails('L101');
        SHowLockerDetails('L102');
        SHowLockerDetails('L103');
    end;

    procedure SHowLockerDetails(LocarCD: Code[20])
    begin
        Message('Selected Locker: %1', LocarCD);
    end;
}