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

    // With Var & Without Var diffrence.
    procedure IncreaseQuantity(Quantity: Integer)
    begin
        Quantity := Quantity + 1;
        Message('Inside procedure: %1', Quantity);
    end;

    procedure IncreaseQuantityVar(var Quantity: Integer)
    begin
        Quantity := Quantity + 1;
        Message('Inside var procedure: %1', Quantity);
    end;

    procedure TestingProcedure()
    var
        Qty: Integer;
    begin
        Qty := 10;
        IncreaseQuantity(Qty);
        Message('After normal procedure: %1', Qty);

        IncreaseQuantityVar(Qty);
        Message('After var procedure: %1', Qty);
    end;

    procedure CalculateLockerValue(Quantity: Integer; Price: Decimal): Decimal
    var
        Result: Decimal;
    begin
        Result := Quantity * Price;
        exit(Result);
    end;

    procedure TestingCalculateLockerValue()
    var
        TotalValue: Decimal;
    begin
        TotalValue := CalculateLockerValue(5, 2500);

        Message('Total Locker Vlaue: %1', TotalValue);
    end;

    procedure CalculateDiscountPrice(Price: Decimal; DiscountPercent: Decimal): Decimal
    var
        Discount: Decimal;
    begin
        if Price <= 0 then
            exit
        else begin
            Discount := Price * DiscountPercent / 100;
            exit(Price - Discount);
        end;


    end;

    procedure CheckDiscount()
    begin
        Message('Result is: %1', CalculateDiscountPrice(100, 10));
    end;

    // Procedure with record parameters
    procedure ShowLockerDetails(LockerRec: Record "Door Loc Master T")
    begin
        Message('Locker Code: %1, Available Qty: %2, Status: %3',
        LockerRec.LockerCode,
        LockerRec.AvailableQty,
        LockerRec.Status);
    end;

    procedure TestRecord()
    var
        LockerRec: Record "Door Loc Master T";
    begin
        if LockerRec.Get(Rec.LockerCode) then begin
            ChnageQuantity(LockerRec);
            LockerRec.Modify();

            Message('After calling the procedure, Available Qty: %1', LockerRec.AvailableQty);
        end;


    end;

    procedure ChnageQuantity(var LockerRec: Record "Door Loc Master T")
    begin
        LockerRec.AvailableQty := LockerRec.AvailableQty - 1;
    end;



}