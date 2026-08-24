table 50453 "Locker Sales"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }

        field(2; "Locker Code"; Code[20])
        {
            TableRelation = "Door Locker Master";
        }

        field(3; "Customer No."; Code[20])
        {
            TableRelation = "Locker Customer";
        }

        field(4; Quantity; Integer)
        {

        }
        field(5; "Unit Price"; Decimal)
        {

        }
        field(6; "Total Amount"; Decimal)
        {

        }

        field(7; "Sales Date"; Date)
        {
        }

        field(8; Status; Option)
        {
            OptionMembers = Open,Completed,Cancelled;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}